Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D76F56D961
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 16:29:32 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id fb10so1078300wid.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=sonw3Ghp0lcPCzD0kbfGUUK+tAzpUcZQj3cfIgNU4Lg=;
	b=BZXuNkU4+vgdgYBPd3LLLBFsqx1ZILTmDog+N48bSHwLVwd8GBXlm7f9yMvso/r2Ti
	VVXCqRPNIwHPjup46175m0MvIhx1n7WVcTQ9Un9bzlsb6hkaHXZEhmMhcZC9m0XUhqTG
	72xoQrwIz42WDgFa+NAN+iv1tHyY1aSmoi6P/IeXnsEqomtETV0ZtYzt9gUXqSUg7j71
	f4EqATWYqjHL85tuBSSqXYFrKck3y5rf046AH8rI0gew9zm8Z1uiFXP7ZAc8iCWYXzbG
	VGVvRJNe2vzZ4w8ar2ma/zPcDVkPyrq+9l2v8BSK1S85tHkdoR9HOc4A3qeBGVL7es2Z
	dtFA==
X-Gm-Message-State: ALoCoQkLkTULu0gvT4u6/3hDbqTaGhUtzxlhIABJTrYjWn2ZxZ9Q/C+jB25ywWfAcKw1WIjadvMq
X-Received: by 10.180.19.201 with SMTP id h9mr21120077wie.36.1384360174333;
	Wed, 13 Nov 2013 08:29:34 -0800 (PST)
Received: from [10.10.1.61] (ppp-82-135-65-185.dynamic.mnet-online.de.
	[82.135.65.185])
	by mx.google.com with ESMTPSA id dj8sm56616263wid.2.2013.11.13.08.29.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Nov 2013 08:29:33 -0800 (PST)
Message-ID: <5283A8EC.4010300@pelagicore.com>
Date: Wed, 13 Nov 2013 17:29:32 +0100
From: Dominik Holland <dominik.holland@pelagicore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5283A080.1050702@pelagicore.com>
In-Reply-To: <5283A080.1050702@pelagicore.com>
Subject: Re: nativesdk-dbus depends on nativesdk-dbus-ptest-ptest
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
X-List-Received-Date: Wed, 13 Nov 2013 16:29:33 -0000
Content-Type: multipart/alternative;
	boundary="------------010100070601010806070106"

--------------010100070601010806070106
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

sorry my fault it needs to be RDEPENDS_dbus_class-nativesdk = ""

but shouldn't than the RDEPENDS_class-native = "" also be changed to 
RDEPENDS_dbus_class-native = ""


Dominik

On 11/13/2013 04:53 PM, Dominik Holland wrote:
> Hi,
>
> i'm trying to port a application which has a dependency to dbus. This 
> tool is host tool and should be included in the sdk.
>
> Because of that i added a dependency to nativesdk-dbus. But it doesn't 
> build for because nativesdk-dbus depends on nativesdk-dbus-ptest-ptest 
> which is not available.
>
> There are 2 options i can see to solve this:
>
> Solution 1: Change the dbus-ptest recipe to also use the nativesdk class.
>
> Solution 2: Change the dbus recipe to not depend on ptest on nativesdks.
>
> I'm favoring Solution 2 and i tried to add RDEPENDS_class-nativesdk = 
> "" to the dbus.inc but that doesn't help.
>
> Is there anything that i'm missing or do i really need to install 
> ptest into my SDK ?
>
> Best Regards
>  Dominik


--------------010100070601010806070106
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi,<br>
      <br>
      sorry my fault it needs to be <font face="monospace">RDEPENDS_dbus_class-nativesdk
        = ""<br>
        <br>
        <font face="sans-serif">but shouldn't than the <font
            face="monospace">RDEPENDS_class-native = ""</font> also be
          changed to </font></font><font face="monospace"><font
          face="sans-serif"><font face="monospace">RDEPENDS_dbus_class-native
            = ""<br>
            <br>
            <br>
            <font face="sans-serif">Dominik</font><br>
          </font></font><br>
      </font>On 11/13/2013 04:53 PM, Dominik Holland wrote:<br>
    </div>
    <blockquote cite="mid:5283A080.1050702@pelagicore.com" type="cite">
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      Hi,<br>
      <br>
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
        </font></font> </blockquote>
    <br>
  </body>
</html>

--------------010100070601010806070106--
