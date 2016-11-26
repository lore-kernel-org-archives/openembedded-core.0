Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 56B3471B10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 15:44:22 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so8294199pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=AVW6dt09hNoJ6FX3kA4UzF6j09h1F2gagVHg+DpY5qg=;
	b=01WhB4SBEW79FlUPRK9pFhx7KsL47NIcL7goOCWEzypEVkAnbCn5PXz0AB5KcEdgP1
	/XnspKixl1cC24N20MCjr9Evjn6s96yMBYEmf5NsEPpNttXYjbJXc4i8RDBO3G1FSafH
	EdAvV3PZRBkP4nwFrFzKp9TYFeW7Y24/RXEecss32oeBt0BZ6uDyBNvqFeBtmp19bowu
	Es1Q0E833AfRE3zZXg1Cwp3NVrv/raDfp9izP7uKo62X0j4bXm7kB9O1H8ZoWwRa4unB
	ovql/Zh78m+3iO4ckO8MDoj8+Q6tog8G0EqYE5+9yU2HWy/v0ExYn8hmznvqgSMHlK7o
	w9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AVW6dt09hNoJ6FX3kA4UzF6j09h1F2gagVHg+DpY5qg=;
	b=T2jW/WN1RQ5QLruUrgDwxN/DqSGdI1ah2FPOEKzh9CO1+x0SS7Gjwrq/1cEH9mEu8g
	NR1Tl8bcur9ogAdsI4YSkb/j6Yo/SqjhkwKOeKubJOIqmEZ2v0dPDv2164jy8QZDHDSL
	kGn40psOMyBFiR8ePjn3chmnIhPLX7nW7QlXP9XyJl2Bz3+18jVIWsIwyYtuowj5v/wx
	YGw45da7fOJ9G8qQdk/7gwp669A46ZIZZ9+XxMFwyLaorgi91XX5G9ET3wUEiZ1P5mY/
	4NGFWSIt0gnFG+SWfE37zv7H9g9rkWgn5usGGF4Ur1NUm6+Ve715uMIGN48BQhr6pQ8t
	Heqg==
X-Gm-Message-State: AKaTC03DFzDdR1n8bVjI/lFUyzd7qEsU3CTMan26kJJ+H8sQUjF6ZUfy6xd/OoVEgs8GtA==
X-Received: by 10.84.139.129 with SMTP id 1mr30192156plr.178.1480175064076;
	Sat, 26 Nov 2016 07:44:24 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:bcc3:6b30:3fc9:245b?
	([2601:202:4001:9ea0:bcc3:6b30:3fc9:245b])
	by smtp.googlemail.com with ESMTPSA id
	t67sm75746039pfg.13.2016.11.26.07.44.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Nov 2016 07:44:23 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
	<1479837333-18054-2-git-send-email-ross.burton@intel.com>
	<486c464b-5757-0788-f722-024b98390d8b@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f7cdb7e6-3ea5-a602-c532-c2854f8912d4@gmail.com>
Date: Sat, 26 Nov 2016 07:44:22 -0800
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
X-List-Received-Date: Sat, 26 Nov 2016 15:44:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


Randy,

On 11/25/2016 04:06 PM, Randy MacLeod wrote:
> Armin,
> 
> Probably a US Thanksgiving glitch but...
> 
> Morty needs both these patches to have an, err build epiphany.

> 

> I don't see a commit on morty or the non-existent morty-next.
> What's the plan?

I just updated my akuster/morty-next contib branch with this and several
security fixes.

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
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
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

