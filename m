Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXxBn-0001pA-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 19:21:05 +0200
Received: by mail-vb0-f43.google.com with SMTP id p14so669062vbm.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 10:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=gUyZ46dDG1Y65Ojm1al+KChXbWHdUMbNewnvf/zFUlc=;
	b=DzmPWFz2uLCZsTBYdedoMSff9D+GzHPwb3mgRxosoa8aO2clMH9VHY0xnKOKu+VXmP
	bELmegPFN9+rhr7SbHXgCCo8We+ghgMk8gInBERJTdjN5EzbNz+Y776557Kg21ZPf75W
	XPCcG5uAxcGDO1NbDUBwktVhx5wcJXWoD/p4xz0tCqSvwlTkzTY413v2SbbWs5J278gN
	z0+8U7ko2J4FnC84ydZYr8ufbw8RHr9yQIV9r12Xt9KAu/PujqSniXG+xT9CkbApX/HA
	OXBAYbkegrKDvs4Ci0qXRMvuGrEnumcqGLLxltZD7XN1seXDsIqRd76f+nVjNM6g8Nad
	klcg==
MIME-Version: 1.0
X-Received: by 10.58.198.79 with SMTP id ja15mr2503332vec.15.1367514189733;
	Thu, 02 May 2013 10:03:09 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 10:03:09 -0700 (PDT)
In-Reply-To: <CALbNGRQw8etC-WM8b0N4SS5ut1Nu=h4CyUAjapHRo4LbWk8S-g@mail.gmail.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
	<CALbNGRRJfRF1qM2gm=SoSs=cjxqrFi7+7xp9SN9X=AMRPesPfw@mail.gmail.com>
	<518281A4.6040900@windriver.com>
	<CALbNGRS4FLKC+_k9iuEeoMCx0o=DsXM-uu1X7uahtcrp24R=oA@mail.gmail.com>
	<CALbNGRRm15aBQXAuqcJDEsvQ2UNC-VKj8_brbGPHj-bqxTaSKw@mail.gmail.com>
	<51828BDE.6050001@windriver.com>
	<CALbNGRQw8etC-WM8b0N4SS5ut1Nu=h4CyUAjapHRo4LbWk8S-g@mail.gmail.com>
Date: Thu, 2 May 2013 19:03:09 +0200
Message-ID: <CALbNGRTVS7-VCrQ-7hvVZ0F7N_EaNNumGFPf_60c_sH=g62khg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 17:21:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2013 at 6:40 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, May 2, 2013 at 5:53 PM, Mark Hatle <mark.hatle@windriver.com> wro=
te:
>>> [andreas@oe-core]$ bitbake -e gdm | grep ^PSEUDO_PASSWD
>>> PSEUDO_PASSWD=3D"/home/andreas/tmp/oe-core-eglibc/sysroots/overo"
>>
>>
>> Check that path contains 'etc/passwd' and 'etc/group'.  If not, that wou=
ld
>> be the issue.. if it does contain them -- then something else is happeni=
ng.
> Yes the path is correct and contains both files with correct IDs
>
>> Hmm.. are either of the hosts 32-bit/64-bit multilib installs?  If so, y=
ou need to ensure that pseudo is enabled to build both
>> a 32-bit and 64-bit wrapper, otherwise you can end up running native sof=
tware that won't be wrapper properly.  (It's fairly
>> rare, but can occur.)
>
> I think both are multilib - have /lib and /lib64 and found same libs
> in both. How do I ensure that both wrappers are build?
>
One thing I just noticed - maybe it has nothing to do with the problem
- concerning build from scratch:

* On the host creating images with correct IDs there are three groups
(=3Dnew parsing) of tasks performed:
    1. pseudo
    2. ??
    3. image
* On the host with incorrect IDs I see only parsing for pseudo and image

In case it has nothing to do with the problem - just for me to
understand: What is the second task group for?

Andreas


