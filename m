Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9zRE-00084k-2R
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 14:49:24 +0100
Received: by wera1 with SMTP id a1so39268wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 06:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1GN57sXLV6Alv5Q8J/w/LUEPUsOtNpCuGOiUd+lEVqU=;
	b=gdYV2ymj56S4/RM2/SY5WfG/WzPtsEcxlWmXdK88Z5Ce1VkUFw7J+yyXmD6c+2ga/V
	FRPRdkxPnE4sA0LGR2fWZ4cu9bpHx57nXCeBtfUoexnpPjOYtyGmySskXMopMStGweMb
	VW+pqsAoECeFoSL2CfGd/vGGWiwfL3gCiIEK5uqq38oKEPCFS+CTk9pV/aVGJ8AxfHJA
	U5t1diDc80Rh8aH+I2Qh07bbqqxAPFjt0PkJNebArC2FIbDJ+BRnv6batuAhcBbzZlzq
	NM9U93ZERMz4qNW302TQi+nalJKm7Pzy5kOHiMra3teexm+gXzESDdrfb1+n0BFAswbv
	6Giw==
Received: by 10.180.24.4 with SMTP id q4mr28939620wif.7.1332250831716;
	Tue, 20 Mar 2012 06:40:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm34096751wie.9.2012.03.20.06.40.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 06:40:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <27193241.TpUGZafhRb@helios>
Date: Tue, 20 Mar 2012 14:40:28 +0100
Message-Id: <3CBB5120-F1A8-4654-BDF3-6A8625FE5352@dominion.thruhere.net>
References: <1332241255-5083-1-git-send-email-koen@dominion.thruhere.net>
	<1812139.SkpSglmEkv@helios>
	<C78FED4E-E3C7-4369-9622-0A4C6AA009DC@dominion.thruhere.net>
	<27193241.TpUGZafhRb@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmWnk+uVt/S9p/21E7SjO9oSZbsLRItu3S+PvA1rQQTLOcne0pFw3z9Jpoaz2zBuDrklug1
Subject: Re: [PATCH 3/3] buildhistory: remove duplicate entries from dot graph
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
X-List-Received-Date: Tue, 20 Mar 2012 13:49:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 14:14 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 20 March 2012 13:11:38 Koen Kooi wrote:
>> I think I know why [2] doesn't work:
>>=20
>> koen@dominion:/data/ssd/OE/buildhistory$ echo b c a | sort
>> b c a
>> koen@dominion:/data/ssd/OE/buildhistory$ echo -e b\\nc\\na | sort
>> a
>> b
>> c
>=20
> Ah, yes, that would explain it. I've primarily been testing with rpm =
for which=20
> list_package_depends produces the output on separate lines, whereas =
the ipk=20
> version is all on one line; it only matters when doing the sort. Oops!
>=20
>> Let me know how you want me to respin this series, each commit is an =
RFC on
>> its own.
>=20
> If you wouldn't mind I think the easiest thing is to drop the =
sort/uniq on the=20
> depends/recommends and just rely on the one at the end that you're =
adding

V2 sent. I'm not really happy with the interaction between patch 1 and =
2, so I'd appreciate some feedback on it.

regards,

Koen=


