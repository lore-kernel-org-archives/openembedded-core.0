Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-bk0-f54.google.com (mail-bk0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5ED6D37F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 15:56:47 +0000 (UTC)
Received: by mail-bk0-f54.google.com with SMTP id 6so441944bkj.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 07:56:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=K77syRe1gOB2L4VRfRkuSiSgdg2CIwzpIoQmSaFClJ0=;
	b=Lg+t40s403ECpeiQL3pEFjHC04GaC2Ys13EvlUQov50KGXXFsmA3HkuJm+B4vm5s6I
	D0pCcrfNrhX5nT0CK+W6UzxvB14GVQ2hQ5UhW3KfAWjA8Sh7Ev9ZpRlDQr8RYT6cP7QM
	laXYK9EaAezynEze6ifXeK9+KxsilNGyhbauq2J9oVsqNDtGNVoXxzXu/y9/ca28oWZk
	+C6oFqcJ60skJBRZXnHanTzde9eSGlMl6SPZfgnY9trXXdUd8VvcczTtX4lNSObySzZm
	lCTKNJpIeETLhRZBD6PtzBnvfx6OndeazMPl1RU6URrLzJ4edxnVcqcB/cJ8XydrLW2H
	55aQ==
X-Gm-Message-State: ALoCoQmrJKMb7t4UVdAicqkJQrwWvHZKjR9GtVifd+ydb4gBrq4fTgYrAiZ9p+Q0iNJm/Zh9kT3G
X-Received: by 10.204.117.3 with SMTP id o3mr1809827bkq.38.1384358208982;
	Wed, 13 Nov 2013 07:56:48 -0800 (PST)
Received: from [10.10.1.61] (ppp-82-135-65-185.dynamic.mnet-online.de.
	[82.135.65.185])
	by mx.google.com with ESMTPSA id z6sm22011894bkn.8.2013.11.13.07.56.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Nov 2013 07:56:47 -0800 (PST)
Message-ID: <5283A13E.2070606@pelagicore.com>
Date: Wed, 13 Nov 2013 16:56:46 +0100
From: Dominik Holland <dominik.holland@pelagicore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5283A080.1050702@pelagicore.com>
In-Reply-To: <5283A080.1050702@pelagicore.com>
X-Forwarded-Message-Id: <5283A080.1050702@pelagicore.com>
Subject: nativesdk-dbus depends on nativesdk-dbus-ptest-ptest
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
X-List-Received-Date: Wed, 13 Nov 2013 15:56:48 -0000
Content-Type: multipart/alternative;
	boundary="------------010302030104040602050109"

--------------010302030104040602050109
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

i'm trying to port a application which has a dependency to dbus. This 
tool is host tool and should be included in the sdk.

Because of that i added a dependency to nativesdk-dbus. But it doesn't 
build for because nativesdk-dbus depends on nativesdk-dbus-ptest-ptest 
which is not available.

There are 2 options i can see to solve this:

Solution 1: Change the dbus-ptest recipe to also use the nativesdk class.

Solution 2: Change the dbus recipe to not depend on ptest on nativesdks.

I'm favoring Solution 2 and i tried to add RDEPENDS_class-nativesdk = "" 
to the dbus.inc but that doesn't help.

Is there anything that i'm missing or do i really need to install ptest 
into my SDK ?

Best Regards
  Dominik



--------------010302030104040602050109
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <div class="moz-forward-container"> <br>
      i'm trying to port a application which has a dependency to dbus.
      This tool is host tool and should be included in the sdk.<br>
      <br>
      Because of that i added a dependency to nativesdk-dbus. But it
      doesn't build for because nativesdk-dbus depends on
      nativesdk-dbus-ptest-ptest which is not available.<br>
      <br>
      There are 2 options i can see to solve this:<br>
      <br>
      Solution 1: Change the dbus-ptest recipe to also use the nativesdk
      class.<br>
      <br>
      Solution 2: Change the dbus recipe to not depend on ptest on
      nativesdks.<br>
      <br>
      I'm favoring Solution 2 and i tried to add <font face="monospace">RDEPENDS_class-nativesdk

        = "" <font face="sans-serif">to the dbus.inc but that doesn't
          help.<br>
          <br>
          Is there anything that i'm missing or do i really need to
          install ptest into my SDK ?<br>
          <br>
          Best Regards<br>
          &nbsp;Dominik<br>
        </font></font> <br>
    </div>
    <br>
  </body>
</html>

--------------010302030104040602050109--
