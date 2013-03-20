Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UIO3r-0003He-Iv
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:48:31 +0100
Received: by mail-oa0-f50.google.com with SMTP id g12so763156oah.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 11:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=yF3d6Xbh+g5mbux0sXKyfeS1BBokYEBwOU99osznDEk=;
	b=PdN54h15hBFxuI0qE+BcMA3NgF0WsMgnxD+mM1hobR30JPxbh/Sk80gAcSqEKJTTw3
	PrVvCGHPt5JDmKa4GLSfS6ADnkPZX5nlYEUTXTxRy/FF9pDsfukUfrv7OvWV8va2j+W+
	XyjqDFyvTjScm8ycFMev/nGyPD1xW5mtw8AzZ+hmhUpvmn9qSNf2udn6zn+VA/sefv62
	/8k9IuwQf5OcAH1pXlsxzwpqdseq0/bAQWYc28GYHTMvdxEMZ18RtDZtDiq52r0E1Ra3
	vN36vJhczkDKqgidd+3TrqICRpwLzqtIwzUeBTGYp9oC30Cpi0QkNRtwhZHY4r4k806d
	bf4Q==
X-Received: by 10.60.2.227 with SMTP id 3mr4747125oex.113.1363804299803;
	Wed, 20 Mar 2013 11:31:39 -0700 (PDT)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id h9sm3096498obg.14.2013.03.20.11.31.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 11:31:38 -0700 (PDT)
Message-ID: <514A008D.3080205@felipetonello.com>
Date: Wed, 20 Mar 2013 11:31:41 -0700
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
	<1363730053-7719-4-git-send-email-eu@felipetonello.com>
	<1813949.PJfGMBEi9g@helios>
In-Reply-To: <1813949.PJfGMBEi9g@helios>
X-Gm-Message-State: ALoCoQmSCJXRye6u77Jk6JoQTsLni/zoZKpAGlXlvXcHZu8H4A0udI4/TcZU5rkgCPVlyNbE/OkO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] qt-mobility: added list of modules to be compiled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 18:48:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Paul,

On 03/20/2013 11:12 AM, Paul Eggleton wrote:
> Hi Felipe,
>
> On Tuesday 19 March 2013 14:54:13 eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> This is useful for users that want to .bbappend this recipe to select
>> specific modules to be compiled.
>>
>> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
>> ---
>>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc index fca4cb0..b0ab613 100644
>> --- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> +++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>> @@ -18,7 +18,7 @@ SRC_URI =
>> "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.t
>> SRC_URI[md5sum]="ea5db5a8d3dd4709c2926dceda646bd8"
>>   SRC_URI[sha256sum]="ee3c88975e04139ac9589f76d4be646d44fcbc4c8c1cf2db621abc1
>> 54cf0ba44"
>>
>> -PR = "r7"
>> +PR = "r8"
>>
>>   S = "${WORKDIR}/qt-mobility-opensource-src-${PV}"
>>
>> @@ -31,6 +31,8 @@ qtm_plugins	:= "/usr/lib/${qtm_dir}/plugins/QtMobility"
>>   qtm_data	:= "/usr/share/${qtm_dir}"
>>   qtm_imports	:= "/usr/lib/${qtm_dir}/imports"
>>
>> +qtm_modules_list ?= "bearer contacts gallery location publishsubscribe
>> messaging multimedia \ +systeminfo serviceframework sensors versit
>> organizer feedback connectivity" qtm_bluezflag ?=
>> "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'yes', 'no', d)}"
>
> Typically variable names like this should be upper case; I know we've got some
> lower case ones in here already but let's not introduce any more that we'll
> have difficulty changing later.

Alright. I just sent a v4.

Felipe



