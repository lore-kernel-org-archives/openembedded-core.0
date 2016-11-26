Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D57D471AA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:32:35 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id x23so6684803pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=1yfqxs5nCM7NJe6hKG2/6D1hMVXxPoFNHp01XKLnMes=;
	b=XRIJGCr0NldF6z1T1gi6bJUxnGAHuwv9jc4rlZPRbTwEDjJcl+X0EzM6sLB09dNZRc
	RsXWBgYfdEg2jiewIUCqs68b51S7iglztSG2RS6vUHiAOxwRgiw+jhiL3Es7Bpqf+cAR
	qI9zQNnC3Yhi63IlXbgC+CJxlMnbytY4ac5TlVVjHE3vr4yKuM0hnhC2x8BydYzwxduX
	4iQ3iafjBMVofv8oxS2CU3345CGK+eRKVsXsF/WqhvD28xoBsvWkHKzsKz4q1MPjilLC
	i2GjUgLm3cYu6jHjTAf0FxxPgsmc2D8lyMPl+3nxGYF/6nnE8K080c5wZ1bE7fKYJ3uC
	F5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1yfqxs5nCM7NJe6hKG2/6D1hMVXxPoFNHp01XKLnMes=;
	b=eMqYCPIwalARXZvH78SGCpliqeF9Kr0Aqh1rMq1kmXM39XrYu7GadZN2zXX3RcYR+Y
	I82OjP9q7SULfN9/maviFvGLbKioyxgkGPm3IGXwFh3OyekVzue9El08zb3yPMiPuH9z
	ykBtBRFk56I3wN2FJJtp1fj7VKHFC6nnrqXsD1O7Mvf5HeK7jc/Dmv6jR/g/uRmzZxg+
	41uANVFGW3cKaG/INwJS58o5VgNM77THwX0AckWFELFWT1y953SbXsEUeZbquhLgTfcp
	Z9UTRefa+aL70aHAgdnzBLR7R9PtorNjE2RdCf20HqH70P2YEIraBw9+KmadgGnhAYjE
	GlQg==
X-Gm-Message-State: AKaTC02yj3KPubsQKKT/UH33BeE02dGEJW6PC0ET3K++bjkLiw/OOM5fk29GGRr37V4Uug==
X-Received: by 10.84.218.207 with SMTP id g15mr22876777plm.78.1480120356948;
	Fri, 25 Nov 2016 16:32:36 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:9185:a279:3950:f671?
	([2601:202:4001:9ea0:9185:a279:3950:f671])
	by smtp.gmail.com with ESMTPSA id
	65sm69534609pfl.21.2016.11.25.16.32.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 16:32:36 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
	<1479837333-18054-2-git-send-email-ross.burton@intel.com>
	<486c464b-5757-0788-f722-024b98390d8b@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <add987a6-5107-352b-a4b3-da3b470c6952@gmail.com>
Date: Fri, 25 Nov 2016 16:32:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <486c464b-5757-0788-f722-024b98390d8b@windriver.com>
Subject: Re: [PATCH][morty 2/2] Revert "epiphany: remove unnecessary libwnck3 dependency"
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
X-List-Received-Date: Sat, 26 Nov 2016 00:32:35 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/25/2016 04:06 PM, Randy MacLeod wrote:
> Armin,
>
> Probably a US Thanksgiving glitch but...
>
> Morty needs both these patches to have an, err build epiphany.
>
> I don't see a commit on morty or the non-existent morty-next.
> What's the plan?

I will take a look and do the needful. Thanks for the pointer.

- armin
>
> ../Randy
>
>
>
> Is there a plan to
> On 2016-11-22 12:55 PM, Ross Burton wrote:
>> This version of epiphany still needs libwnck3.
>>
>> This reverts commit fb5c4f181176710a4cfb3c875b5edb4e5aa5df73.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-gnome/epiphany/epiphany_3.20.3.bb | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb 
>> b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
>> index 9115892..eba480b 100644
>> --- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
>> +++ b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
>> @@ -2,10 +2,11 @@ SUMMARY = "WebKit based web browser for GNOME"
>>  LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>
>> -DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates 
>> avahi libnotify gcr \
>> +DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates 
>> avahi libnotify gcr libwnck3 \
>>         gsettings-desktop-schemas gnome-desktop3 libxml2-native 
>> intltool-native"
>>
>>  inherit gnomebase gsettings distro_features_check 
>> upstream-version-is-even
>> +# libwnck3 is x11 only
>>  REQUIRED_DISTRO_FEATURES = "x11"
>>
>>  SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
>> @@ -21,3 +22,4 @@ do_configure_prepend() {
>>  FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 
>> ${datadir}/gnome-shell/search-providers"
>>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
>>  RRECOMMENDS_${PN} = "ca-certificates"
>> +
>>
>
>


