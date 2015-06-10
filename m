Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9647589E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 19:42:09 +0000 (UTC)
Received: by qcej9 with SMTP id j9so21057906qce.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 12:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J3mdO1Tv5N+tLTP018qAFqTalFdrz4vykqYIqzYMYOo=;
	b=NWkBS3Mt4O1r0VGoKFSrpalmS9P9Apg23NlZuC6JZ9eQLtSXmomI5PI9Aik8o0jHCF
	brlCP6A5OvVPpfAjHfbhdCMQvQW5gvlvwfMbSzAkEvUwHOlRsQn7gf6VGif7dN93f5pW
	aJVjwr7XRT6DW4mddDgcYBcrDUvJ7eV9ju9SKBZ19Qk/VaYqi0Vrz7xtiyVu2DgmWlUz
	VqzyJhw3Zs1lCo+wvrwkWYvqpePsCdwVWw4ocO696OCe0qSOaq/PweZRQzylPJnbd13B
	mi3K54MKg/o353a4uTW9rx/hpvpV/jo4qYJJPI3+mBvYhF65jRY5KBYOEC+dKequipTD
	/TxA==
X-Gm-Message-State: ALoCoQlcddMHdncLLgi+/jH1z1HDhnhcl+jImW31klCZNRqOvR44XqyfF4hWn4QvCm/WD5OoQnts
X-Received: by 10.55.18.155 with SMTP id 27mr10537116qks.36.1433965330610;
	Wed, 10 Jun 2015 12:42:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 12:41:50 -0700 (PDT)
In-Reply-To: <CAJTo0LYZY_8ZC2pLBL6YKg+Da+6TS5h0d+2gmsLRmJxWwzfGZQ@mail.gmail.com>
References: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
	<CAJTo0LYZY_8ZC2pLBL6YKg+Da+6TS5h0d+2gmsLRmJxWwzfGZQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 20:41:50 +0100
Message-ID: <CAJTo0LZdjrVrYb9cjun+YPYt8mRp9PE7AOGqQKQgGw0no78NYQ@mail.gmail.com>
To: Moritz Blume <moritz.blume@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Wed, 10 Jun 2015 19:42:12 -0000
Content-Type: multipart/alternative; boundary=001a1147379626cd5305182f129e

--001a1147379626cd5305182f129e
Content-Type: text/plain; charset=UTF-8

On 10 June 2015 at 17:49, Burton, Ross <ross.burton@intel.com> wrote:

> I see this causes piglit to fail to build, which is a problem if we want
> this in oe-core.   I'm having a quick look to see if upgrading piglit helps
> but right now this is blocking merging.
>

Upgrading piglit seemed to help, re-running a world build now.

Ross

--001a1147379626cd5305182f129e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 June 2015 at 17:49, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I see this=
 causes piglit to fail to build, which is a problem if we want this in oe-c=
ore. =C2=A0 I&#39;m having a quick look to see if upgrading piglit helps bu=
t right now this is blocking merging.</div></blockquote><div><br></div><div=
>Upgrading piglit seemed to help, re-running a world build now.</div><div><=
br></div><div>Ross=C2=A0</div></div></div></div>

--001a1147379626cd5305182f129e--
