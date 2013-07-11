Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4C43C60592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:03:48 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1UxBqv-0001uA-5x from Muhammad_Shakeel@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Jul 2013 01:03:49 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 11 Jul 2013 01:03:48 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 11 Jul 2013 09:03:46 +0100
Message-ID: <51DE670A.4010003@mentor.com>
Date: Thu, 11 Jul 2013 13:04:26 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Jul 2013 08:03:48.0733 (UTC)
	FILETIME=[2C8B62D0:01CE7E0D]
Subject: Re: [PATCH] [v2] openssh: Enabling with systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2013 08:03:48 -0000
Content-Type: multipart/alternative;
	boundary="------------010706050707050201050105"

--------------010706050707050201050105
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 12:45 PM, Shakeel, Muhammad wrote:
> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
> @@ -0,0 +1,11 @@
> +[Unit]
> +Conflicts=sshd.service
|sshd.service is the ||service file for running a single SSH server for 
all incoming connections, suitable only for systems with a large amount 
of SSH traffic. ||In almost all other cases it is a better idea to use 
sshd.socket + sshd@.service (i.e. the on-demand spawning version for one 
instance per connection). In case these both are present, there will be 
a conflict and systemd should be aware of it.
|

--------------010706050707050201050105
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 07/11/2013 12:45 PM, Shakeel,
      Muhammad wrote:<br>
    </div>
    <blockquote
      cite="mid:1373528728-27268-1-git-send-email-muhammad_shakeel@mentor.com"
      type="cite">
      <pre wrap="">+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd.socket
@@ -0,0 +1,11 @@
+[Unit]
+Conflicts=sshd.service
</pre>
    </blockquote>
    <code>sshd.service is the </code><code>service file for running a
      single SSH server for all incoming connections, suitable only for
      systems with a large amount of SSH traffic. </code><code>In
      almost all other cases it is a better idea to use sshd.socket +
      <a class="moz-txt-link-abbreviated" href="mailto:sshd@.service">sshd@.service</a> (i.e. the on-demand spawning version for one
      instance per connection). In case these both are present, there
      will be a conflict and systemd should be aware of it.<br>
    </code>
  </body>
</html>

--------------010706050707050201050105--
