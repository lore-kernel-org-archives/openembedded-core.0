Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3494B6B221
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 11:09:31 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf11so1230390vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=LO0cb12pknuqlVbU+bCUuUrFg6fe4qE1xtTN8S6qy5I=;
	b=f6dxNqDF9ONB3nLmyXzBw6v0r/q8bpNnfz35cXZfk1TZNsKzzkXERRF3t0bTVlN0sy
	7G1W4iII+FGCexXvRkw9s64KDqzsHQFfBnvYwO2niFAQI/uh1U7piMJm3BeoXl/mipEb
	QF90eXSmekiXx/nTdfwrclvARaXhIzdYaIAUpLN0j5nh43BJ/bYefRI8v7eB7IWOPlTH
	61SUnJX1D3yb7zKs2bzL46wKD3duhGQW23IQvgpFPvuIKlWdGnzx84EiZwWrrlGeF6bQ
	5az9xyqx1ffQoGHxXlkTr9V1hqA0KNYKxVY9d9y/MMnl9m6HfYDQnKdaQHrQAd8cgpU4
	3AHw==
X-Received: by 10.58.54.70 with SMTP id h6mr1918107vep.36.1374059371172; Wed,
	17 Jul 2013 04:09:31 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Wed, 17 Jul 2013 04:08:51 -0700 (PDT)
In-Reply-To: <1374057911.2651.118.camel@phil-desktop.brightsign>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 17 Jul 2013 12:08:51 +0100
X-Google-Sender-Auth: RoJPiiSfFlveRNQ2MJ0jSKSMCQk
Message-ID: <CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Wed, 17 Jul 2013 11:09:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 17 July 2013 11:45, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2013-07-17 at 16:40 +0800, Jesse Zhang wrote:
>> Fix failures when building with -fno-omit-frame-pointer (and without
>> optimization, i.e. -O0):
>>
>>     In file included from atomic_ops.h:212:0,
>>                      from atomic_ops_stack.h:32,
>>                      from atomic_ops_stack.c:23:
>>     atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
>>     atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
>>        __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
>
> This seems like it must be a bug in either GCC or the libatomic-ops
> source code, and whichever one has the bug ought to be fixed.  Forcing
> -fomit-frame-pointer might be ok as a temporary measure but it doesn't
> seem like a very good long-term solution.
>

If this is on x86, standard Linux desktop/server distros may have ran
into the same problem. Maybe worth having a look if/how they handle
this.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

