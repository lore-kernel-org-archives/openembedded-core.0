Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 807F772407
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 16:17:25 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id a41so1430061yho.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 08:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=wDYtTvQkkem1YreT/ylMYjk09rIFJJrAL2SIyE0t0Ig=;
	b=tQeODC485ySm/vzedHxabkvv1YccUxy0YWv2KaG9mJJLTnmXeilNv3lxlJU31CFxEO
	ZL6HUvY+cSJ8+goXsqMiTmbF4QZrBAKvU/4F8iVUeyg0FPfz/AzlXv089GcZsGSu3XwE
	4/ZZkpUy4Rvy8N0KlNMasot2TN/V4TMMOi6vGGLqZNOA/YsEFOxZvjbukGThUBn7spnm
	vKE0HNwwczKrmP+1b6suvCZY9nX+Z3W2P7TA5pynwrEyNGJQFcHTlDuXCREoCOy6Xsrm
	U5h9CtkliXTkXqFiLtKecb57Im8QPFFS4WDHFy5sJ9trcl/RXZMceP1oQh0S39QJR9X1
	cb2g==
MIME-Version: 1.0
X-Received: by 10.236.164.232 with SMTP id c68mr3733843yhl.102.1418228246031; 
	Wed, 10 Dec 2014 08:17:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 10 Dec 2014 08:17:25 -0800 (PST)
In-Reply-To: <1418228127.22903.61.camel@linuxfoundation.org>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C7CF45250@ORSMSX103.amr.corp.intel.com>
	<54873BE9.9030905@linux.intel.com>
	<CAJTo0LbVEYT9=fo_gKAk0wRSg1H9_-vE5dd5N-SMrMXM38Lbvw@mail.gmail.com>
	<CAP9ODKp2nSb5qMVPW6tfG9Wm3zwuopPDt4Hm4+EY+eBjYyS4Jw@mail.gmail.com>
	<1418228127.22903.61.camel@linuxfoundation.org>
Date: Wed, 10 Dec 2014 14:17:25 -0200
X-Google-Sender-Auth: W1pdHDmVQtSxiW1b00isdNbBc8Y
Message-ID: <CAP9ODKpZ9bHJOnjLthir2XNntSORzEQUNe0jE2DJptLoL6Vr9Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 10 Dec 2014 16:17:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 2:15 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-12-09 at 18:19 -0200, Otavio Salvador wrote:
>> On Tue, Dec 9, 2014 at 6:06 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>> >
>> > On 9 December 2014 at 18:14, An=C3=ADbal Lim=C3=B3n <anibal.limon@linu=
x.intel.com>
>> > wrote:
>> >>
>> >> I don't know, maybe Ross knows?.
>> >
>> >
>> > I ask for Piglit results to verify that approx 95% passes as that's th=
e
>> > expected pass rate.  I don't bother tracking the exact count as how it
>> > changes as there's almost ten thousand tests and at some point you hav=
e to
>> > let upstream deal with this.
>>
>> What is the point in having a tool for regression test if it is not trac=
ked?
>
> Going forward, the plan is to track this FWIW. Right now that is a work
> in progress as the test result collection piece is missing. Its also a
> chicken and egg problem, you can't track things until you have some
> tests to track. Things are being run manually to check for regressions
> in a coarse manner too and this is better than not at all.

Well, when asked Ross said he is not tracking this data. So the question...

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

