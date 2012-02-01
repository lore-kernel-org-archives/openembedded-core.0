Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RsfUB-0001Pj-QR
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 20:04:51 +0100
Received: by lbol12 with SMTP id l12so229145lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 10:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=BtZYfFczTR7FKQEhrTxHCgydFhvhN35fWhfAgz2YXrQ=;
	b=vXR0Ca3FWdpZX6276NQlaqI/+oW/601oS0PiouR3w3SQ3rSDyWJrLGuNlqeLVdD6Ja
	cEi/MLC6LiN+uWV1kkXmtdMe7SOQ70UUFuGg3Cuq6S/KqP7v0N+vveDwjgRHavTJAtgM
	12gKK177wXRtBMWD7u8Rt3rlKDSGyiJCNowk0=
MIME-Version: 1.0
Received: by 10.112.83.197 with SMTP id s5mr7156206lby.9.1328122616612; Wed,
	01 Feb 2012 10:56:56 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Wed, 1 Feb 2012 10:56:56 -0800 (PST)
In-Reply-To: <20120201182405.GD6969@jama.jama.net>
References: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
	<20120201182405.GD6969@jama.jama.net>
Date: Wed, 1 Feb 2012 19:56:56 +0100
Message-ID: <CALbNGRTk64A=PCvLCTmpo_k0Drr5AjBczukkukwimKdNgPnLtw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: accessing variables
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
X-List-Received-Date: Wed, 01 Feb 2012 19:04:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 7:24 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Wed, Feb 01, 2012 at 07:15:19PM +0100, Andreas M=FCller wrote:
>> another stupid question from my side:
>>
>> do
>>
>> bb.data.getVar('foo', d, 1)
>>
>> and
>>
>> d.getVar('foo', 1)
>>
>> access the same data?
>
> Should be and later is preferred AFAIK, see:
> http://git.openembedded.org/openembedded-core/commit/?id=3Db22831fd63164c=
4db9c0b72934d7d734a6585251
>
> Cheers,
>
>>
>> Thanks in advance
>>
>> Andreas
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
Thank you for details helping me understanding what's going on :)

Andreas


