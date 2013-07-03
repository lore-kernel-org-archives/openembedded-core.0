Return-Path: <net147@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 484B7618B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 23:13:42 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wz7so596172pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=XLzEb8C9rNqHUCqxoXBY509VtvelawtesCGPDq0rGNk=;
	b=VtQ75Sn2zhLBiFt3laxeS6K9iLvhdEI7CxeIFsWPD8YUByn8pFlR4tbA1RIxzxWEH1
	NnpasC0TnThbcXp7en0OvRDsJ9JoisPUKDKSpEQPgVhyTBxpmPzKjDri7a07HE5a8Jdx
	mfgXKahnMzPvM7nBuO7GFiwMxLHts+hiadRRnDg1vBx1Se4miubtzlN67Mwq8b/SliPn
	ermONONqY2nuQoIuf9Ik/VjK90e1j51Ng6u3Y6PDUZ9keMIvKHqI8wYk43ZAdojSX2TP
	0p2gDwFAwjY4Ogv/v1Es6Ir2ttbMZORf2AARM/qNOwljMrZnYF5ajv90K8fffB1XGeEe
	mWXw==
X-Received: by 10.68.179.225 with SMTP id dj1mr2782498pbc.193.1372893223168;
	Wed, 03 Jul 2013 16:13:43 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id fr1sm205553pbb.26.2013.07.03.16.13.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 16:13:42 -0700 (PDT)
Message-ID: <51D4AEFD.5000405@gmail.com>
Date: Thu, 04 Jul 2013 09:08:45 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1372845322-12862-1-git-send-email-net147@gmail.com>
	<51D49B7A.1070906@linux.intel.com>
In-Reply-To: <51D49B7A.1070906@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4: upgrade to 4.8.5
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
X-List-Received-Date: Wed, 03 Jul 2013 23:13:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/07/2013 7:45 AM, Saul Wold wrote:
> On 07/03/2013 02:55 AM, Jonathan Liu wrote:
>> Removed patches integrated upstream.
>>
>
> Jonathan,
>
> I am seeing the following failures on a world build:
>> Found library in wrong location: 
>> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/.debug/libqmlqwidgetsplugin.so
>> Found library in wrong location: 
>> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/libqmlqtimeexampleplugin.so
>> Found library in wrong location: 
>> /usr/bin/qtopia/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/.debug/libqmlqtimeexampleplugin.so
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in: 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/qt4-embedded/4.8.5-r52.4/temp/log.do_package.29418
>> ERROR: Task 1259 
>> (/srv/hdd/poky/meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb, do_package) 
>> failed with exit code '1'
>> ERROR: QA Issue: Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/styleplugin/styles/libsimplestyleplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/styleplugin/styles/.debug/libsimplestyleplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/echoplugin/plugin/libechoplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/echoplugin/plugin/.debug/libechoplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/plugandpaint/plugins/libpnp_extrafilters.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/tools/plugandpaint/plugins/.debug/libpnp_extrafilters.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/imageprovider/ImageProviderCore/libqmlimageproviderplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/imageprovider/ImageProviderCore/.debug/libqmlimageproviderplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/qwidgets/QWidgets/libqmlqwidgetsplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/qwidgets/QWidgets/.debug/libqmlqwidgetsplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/plugins/libqmlqwidgetsplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/plugins/.debug/libqmlqwidgetsplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/libqmlqtimeexampleplugin.so
>> Found library in wrong location: 
>> /usr/bin/qt4/examples/declarative/cppextensions/plugins/com/nokia/TimeExample/.debug/libqmlqtimeexampleplugin.so
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> ERROR: Function failed: do_package_qa
>> ERROR: Logfile of failure stored in: 
>> /srv/hdd/builds/world/tmp/work/mips32-poky-linux/qt4-x11-free/4.8.5-r50.4/temp/log.do_package.29597
>> ERROR: Task 2733 
>> (/srv/hdd/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb, do_package) 
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 11487 tasks of which 6160 didn't need 
>> to be rerun and 3 failed.
>> No currently running tasks (11487 of 11561)
>> > Summary: 3 tasks failed:
>> /srv/hdd/poky/meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb, 
>> do_compile
>>   /srv/hdd/poky/meta/recipes-qt/qt4/qt4-embedded_4.8.5.bb, do_package
>>   /srv/hdd/poky/meta/recipes-qt/qt4/qt4-x11-free_4.8.5.bb, do_package
>> Summary: There was 1 WARNING message shown.
>> Summary: There were 7 ERROR messages shown, returning a non-zero exit 
>> code.
>
>
> Sau!

I didn't actually get those "Found library in wrong location" 
warnings/errors when building qt4-x11-free.
usr/bin/qt4/examples/tools/styleplugin/styles/libsimplestyleplugin.so 
also exists in 4.8.4.
I am currently based on top of eaa5df34af42b6a37f6506847d0f3ef6ba0d298a.

Is there something I need to add to INSANE_SKIP_${QT_BASE_NAME}-examples 
and INSANE_SKIP_${QT_BASE_NAME}-examples-dbg to silence these errors?

Regards,
Jonathan

