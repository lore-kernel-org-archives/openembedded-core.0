Subject: Re: [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: openembedded-core@lists.openembedded.org
From: "Colin Finck" <c.finck@enlyze.com>
X-Originating-Location: Cologne, North Rhine-Westphalia, DE (78.34.121.4)
X-Originating-Platform: Windows Firefox 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 06:32:11 -0800
References: <f7074841-6830-7090-9808-b7987f5c9587@gmail.com>
In-Reply-To: <f7074841-6830-7090-9808-b7987f5c9587@gmail.com>
Message-ID: <4886.1614609131834348150@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

That comes two days after my patch: https://lists.openembedded.org/g/openem=
bedded-core/topic/patch_dosfstools_upgrade/80928608

I would highly recommend the "--without-iconv" option I've added, to preve=
nt error messages about non-existing conversion tables followed by "Using i=
nternal CP850 conversion table" (which it does all the time using --without=
-iconv).

Apart from that, I urge you to backport the fixed version at least down to=
 dunfell, maybe even to earlier releases.
dosfsck 4.2 no longer marks directory entries created by mtools <=3D 4.0.1=
9 as bad, which previously rendered lots of FAT boot partitions (Raspberry =
Pi/UEFI) unbootable.
mtools <=3D 4.0.19 is part of "warrior" and earlier and used by e.g. meta-=
mender during build. Therefore, many affected FAT partitions can be found i=
n the wild.

Best regards,

Colin Finck
