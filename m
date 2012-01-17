Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnGh0-0000pR-Rz
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:35:46 +0100
Received: by lami14 with SMTP id i14so2467216lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 13:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=qRzS5Tb7q2IuLARYZjpjGcFYuGd1aVWv7Ss/5TGqzXI=;
	b=XESQjU44czbXwFbtp5BWo+gvhx90kI65XByi34A3r3p053Hp6Yflv7H5TdiynRpbeX
	yjRqG6cpdvn+rtd8++yQapmDZSQ3k9lKkyIxMjGUmksaufCJ3qbp+Z0XwYabf0xcCctn
	rcd5A2nMK+aKo2453TNPqeQ++XwW3eQ7wKVv4=
Received: by 10.112.36.132 with SMTP id q4mr4687104lbj.3.1326835689354; Tue,
	17 Jan 2012 13:28:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 13:27:38 -0800 (PST)
In-Reply-To: <4F15E5F0.8010500@linux.intel.com>
References: <1326819016-7111-1-git-send-email-raj.khem@gmail.com>
	<1326819016-7111-2-git-send-email-raj.khem@gmail.com>
	<4F15E5F0.8010500@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 13:27:38 -0800
Message-ID: <CAMKF1soqjTR+xWd2C5U2dbnSM49SuDHQ7QDotpDEvD+Y1HVeXA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] uclibc: Upgrade to latest master
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
X-List-Received-Date: Tue, 17 Jan 2012 21:35:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 1:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/17/2012 08:50 AM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../uclibc/uclibc-git/cross_compile_check.patch =C2=A0 =C2=A0| =C2=
=A0 13 +
>> =C2=A0.../recipes-core/uclibc/uclibc-git/fix_libdl.patch | =C2=A0 58 +++
>> =C2=A0.../uclibc/uclibc-git/orign_path.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0183 --------
>> =C2=A0meta/recipes-core/uclibc/uclibc-git/rtld_no.patch =C2=A0| =C2=A021=
6 ---------
>> =C2=A0.../uclibc/uclibc-git/sort-sections-option.patch =C2=A0 | =C2=A0 1=
5 +
>> =C2=A0meta/recipes-core/uclibc/uclibc-git/uClibc.distro =C2=A0| =C2=A0 =
=C2=A02 +
>> =C2=A0.../uclibc-git/uclibc_scheduler_update.patch =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0455
>> --------------------
>> =C2=A0meta/recipes-core/uclibc/uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0meta/recipes-core/uclibc/uclibc_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 13 +-
>> =C2=A09 files changed, 97 insertions(+), 860 deletions(-)
>> =C2=A0create mode 100644
>> meta/recipes-core/uclibc/uclibc-git/cross_compile_check.patch
>> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-git/fix_libdl.p=
atch
>> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-git/orign_path.=
patch
>> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-git/rtld_no.pat=
ch
>> =C2=A0create mode 100644
>> meta/recipes-core/uclibc/uclibc-git/sort-sections-option.patch
>> =C2=A0delete mode 100644
>> meta/recipes-core/uclibc/uclibc-git/uclibc_scheduler_update.patch
>>
> Khem,
>
> These new patches don't have Upstream-Status or Signed-off-by tags.

Yeah. these should be all pushed upstream and signed-off-by me. :)
but since this is git recipe I did not do it since soon it will become 0.9.=
33
release and thats when I planned to do it. I will add it anyway
with next rev which should happen soonish.

-Khem


