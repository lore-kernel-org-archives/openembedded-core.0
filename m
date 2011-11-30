Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RVi2q-0006k5-89
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 12:09:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAUB315S005534
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 03:03:03 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 30 Nov 2011 03:03:01 -0800
Message-ID: <4ED60CE1.5060407@windriver.com>
Date: Wed, 30 Nov 2011 19:00:49 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1322648566.git.xiaofeng.yan@windriver.com>	<43e4ff11b1c935566e81f3ad7f2c64a709c4cdb3.1322648566.git.xiaofeng.yan@windriver.com>
	<068EE226-9491-4B42-BAEC-A2B762CCF748@dominion.thruhere.net>
In-Reply-To: <068EE226-9491-4B42-BAEC-A2B762CCF748@dominion.thruhere.net>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 1/2] x11-common: Change drive mode of Xfbdev when xserver using framebuffer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 11:09:44 -0000
Content-Type: multipart/alternative;
	boundary="------------020207020409020805040101"

--------------020207020409020805040101
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?11?30? 18:50, Koen Kooi wrote:
> Op 30 nov. 2011, om 11:33 heeft Xiaofeng Yan het volgende geschreven:
>
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> The previous mode of starting X is as follow:
>> $Xfbdev :0 -keybd keyboard -mouse tslib
>> This mode cause that some keys can't be mapped rightly. \
>> for example "Down" have the same function with "Enter".
>>
>> another drive mode "evdev" can work rightly in new version.
>> $Xfbdev :0 -keybd evdev,,device=/dev/input/event0 -mouse tslib
> How do you know that event0 is the keyboard?
I get this with qemuarm by test
Do you have better method?
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------020207020409020805040101
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
    <title></title>
  </head>
  <body text="#000000" bgcolor="#ffffff">
    On 2011&#24180;11&#26376;30&#26085; 18:50, Koen Kooi wrote:
    <blockquote
      cite="mid:068EE226-9491-4B42-BAEC-A2B762CCF748@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
Op 30 nov. 2011, om 11:33 heeft Xiaofeng Yan het volgende geschreven:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Xiaofeng Yan <a class="moz-txt-link-rfc2396E" href="mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>

The previous mode of starting X is as follow:
$Xfbdev :0 -keybd keyboard -mouse tslib
This mode cause that some keys can't be mapped rightly. \
for example "Down" have the same function with "Enter".

another drive mode "evdev" can work rightly in new version.
$Xfbdev :0 -keybd evdev,,device=/dev/input/event0 -mouse tslib
</pre>
      </blockquote>
      <pre wrap="">
How do you know that event0 is the keyboard?</pre>
    </blockquote>
    I get this with qemuarm by test<br>
    Do you have better method?<br>
    <blockquote
      cite="mid:068EE226-9491-4B42-BAEC-A2B762CCF748@dominion.thruhere.net"
      type="cite">
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020207020409020805040101--
