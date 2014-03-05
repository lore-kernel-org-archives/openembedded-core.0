Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 942046E85D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 13:46:38 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so1055527veb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 05:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=bwJJCzt4VvjOMXRXiDa8FTCpm1Yb9QBHuaTfCijDtxo=;
	b=S9KuDYhHnDLYj7YPkXHJxjkFTPTOeVtKgwgy0iQ3wvNUiBmGjVmW6e1iaiR4yofcam
	gdMkx+bcYrQac4EY6M57Ho2NZwN3SkiwLurV/GcUo3zDQhZTuBCnMVhE7P5AOIvgRoGG
	fIb2sf4fjZKbvdACy/Phz0bB/ZXi+DMI+Y19ahRucbUmK7ptGkt7L/syZ2NSuqLJss1d
	C3g99rGSq4PP/o58zrririZ/vQLwmNGOx6V3+ukwv5FdaSIXVFcUThSXiQq9xt8Z9D5B
	OUGLRT2wdGBgenurb6re6ARlJ3iVku6IYtEm9v+VayWXLU4y91RknqUVBsWJin0++pXQ
	MDwg==
X-Received: by 10.221.37.1 with SMTP id tc1mr175711vcb.32.1394027199042; Wed,
	05 Mar 2014 05:46:39 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 5 Mar 2014 05:45:58 -0800 (PST)
In-Reply-To: <CANyK_8eviu1Tpoggak7UGEX_i7EJBfWN8ugwUoSMifC8hNXjDA@mail.gmail.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
	<1394011283.31845.97.camel@ted> <5316F554.1030201@windriver.com>
	<CANyK_8eviu1Tpoggak7UGEX_i7EJBfWN8ugwUoSMifC8hNXjDA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 5 Mar 2014 13:45:58 +0000
X-Google-Sender-Auth: aDsVa3x1rQ4XSUEVNPz4iHhEYvc
Message-ID: <CANyK_8e+MOp6TSL_-yAxeo7ebXWYQt+OsD_nGBYq9y2kuYC4vA@mail.gmail.com>
To: Lu Chong <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 13:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 March 2014 12:49, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 5 March 2014 09:58, Lu Chong <Chong.Lu@windriver.com> wrote:
>>
>> In flex 2.5.38, libfl.so was built by libtool.
>>
>> ipsec-tools shows this problem.
>> When link libipsec.so to libfl.so, it uses '-lfl' flag. It will link from
>> libfl.so.
>> But libfl.so doesn't define yylex, we may get "libfl.so not found" through
>> `ldd libipsec.so'.
>
> I've used flex before, this is correct, libfl is not supposed to
> define yylex. See for example
> https://www.mail-archive.com/tools-linking@mail.opensolaris.org/msg00601.html
>
> The problem is in how ipsec-tools is being linked, not in flex. I'd
> suggest patching that recipe instead.
>
> Cheers,
>

I've patched ipsec-tools to fix this, will send the patch to the oe-devel list.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

