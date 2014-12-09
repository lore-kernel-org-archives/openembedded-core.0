Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3286017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 20:19:24 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id f10so632546yha.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 12:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=G/GsGClLNDrprCy2qYYL6KzOJa7KnilxPXIe7ytevIQ=;
	b=JCEk/tipEY1vx3gvRiGMenajPB9TwuJXi8o9B09hhHaZ3wWfOSiELUUzJyoMGqWOoQ
	oAUyAN14YyUJLXPvdVjRm/qgM4R+AfG7O2pO4c7MZxUDwyCcf8gjZXQIuy1qhIX5X5hX
	2yVBp95V4iSqD/CUaLtl8Vpv4aJUrfgt/AFm5C1gIG3waIip3rudCPhfNHFM42bEerrV
	l64fsjjXewjpmgSGd4hzLHtYuXa1dYGdinZl3XhDAlJWDWaT3mW7dUlmBMfkgcsUYdaY
	JQGq9jk942IGSsHZFb9IZ+nNqeQNbwNeELqr2t06CBixRqKRMMl5cE8dSc28ySdX6ey/
	WW+w==
MIME-Version: 1.0
X-Received: by 10.236.109.166 with SMTP id s26mr30624yhg.67.1418156365266;
	Tue, 09 Dec 2014 12:19:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Tue, 9 Dec 2014 12:19:25 -0800 (PST)
In-Reply-To: <CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
Date: Tue, 9 Dec 2014 18:19:25 -0200
X-Google-Sender-Auth: RwC2QjNzA1Pj1DwOGmPVYBxFnOo
Message-ID: <CAP9ODKp2nSb5qMVPW6tfG9Wm3zwuopPDt4Hm4+EY+eBjYyS4Jw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/3] Upgrades for comply Intel Graphics Stack Release 2014Q3
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
X-List-Received-Date: Tue, 09 Dec 2014 20:19:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 9, 2014 at 6:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 9 December 2014 at 18:14, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.i=
ntel.com>
> wrote:
>>
>> I don't know, maybe Ross knows?.
>
>
> I ask for Piglit results to verify that approx 95% passes as that's the
> expected pass rate.  I don't bother tracking the exact count as how it
> changes as there's almost ten thousand tests and at some point you have t=
o
> let upstream deal with this.

What is the point in having a tool for regression test if it is not tracked=
?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

