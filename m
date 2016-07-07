Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5237260119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:55:06 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id m2so284659qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 18:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8yIT48YQk+wITGSJPFdXtckAeFn1Iqn2isrVsMLNH3I=;
	b=rMtOS3q2NP0X5VPo3RvUifhwiTdRrc7X07HgrCOEVmd8rE7RJXruKwnYp1oUx2EBWl
	mYb4Zd7d+9NBuY/q/uLI1BT1M93FXWRQ/M+9Gvrhyy3nDMxtsHHPKTZBYFFG+UtYNrSu
	W4JAHiB1XCfViVIHhn6PdAx9A2OdITRWrRmzjBgOPAv6X5z/rQwX9wTfvg+t4nb8QxSY
	8QLwEI604bJV4VzIPFp87FaYLM/hN1P/zA0k+CISeCTm6x+/aO5b0g0vRhelWM+/gdW4
	Tfj5O1i+S8lCDNnaT35OpBSPWyv/wZ3hgU07pcidstkpO8JzpfkeLGklIUXmBCYR3HtJ
	LNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8yIT48YQk+wITGSJPFdXtckAeFn1Iqn2isrVsMLNH3I=;
	b=R/B1JC/qN9xzL6VkCSz6kM8DkiJdeAyel6CX66OffyYSum2gyJOlvm1gLwZIJsJDnl
	EUK56Sbjl2ClUpbA4GCtxgs5dpRr1P13lErJCue1IbHklQNWekyVk1yJaEdeyGEzmL70
	Z4d2VYY8YQoSAkJUGRTbdRKnUX5xmZlEqsJzJj3cioh4QJ838Wg7RAqv7yLqOIF5kv1S
	foY8ZN8TY6W+q+oBHyrSlOvN8qndsxcEEuWnLRXozIOdFcjdV/oObBUbvsj6eUNr0h3P
	f87d9hx57JxXme7TfSDTjpK0tMvuURyjc/plPxHvJUQH9Nk1yHNrDbbmMYvz+sSJ02+c
	uWjA==
X-Gm-Message-State: ALyK8tLbeLAPRMbPhBdctT9RnIhU7kk6IUQa8ICAP/wMFeSWVhfgO24s4CtNXBehwSZZlXy4nfjXBtsxIptsCA==
X-Received: by 10.200.33.172 with SMTP id 41mr40481347qty.26.1467856507485;
	Wed, 06 Jul 2016 18:55:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 18:54:37 -0700 (PDT)
In-Reply-To: <2740868.VrTjpvQuVY@peggleto-mobl.ger.corp.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<353972ade9bce1a35f889dd8a9496ea104a1470e.1467849364.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp1hg6u2HpdMDy+-6Ek1-rWm7_6HWeHtdrQ+L=_83zFYg@mail.gmail.com>
	<2740868.VrTjpvQuVY@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 18:54:37 -0700
Message-ID: <CAMKF1srwZapMVvohESS8L8+CT0YCQmtVUbH32X_KvLwRZnokpQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Thu, 07 Jul 2016 01:55:07 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 6:39 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Khem,
>
> devtool itself already understands not to try to deal with these recipes - it
> will print out a reasonable error for the user. The exception list is just for
> the devtool-stress script so that it produces clean output.

OK understood the case, I was just thinking of cases where recipes are external
and for some reason dont yet work with devtool, may be can be
blacklisted in recipes
instead of having a central list.

>
> Cheers,
> Paul
>
> On Wed, 06 Jul 2016 17:42:22 Khem Raj wrote:
>> On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > These recipes can't be used with devtool because they can't be unpacked
>> > in the normal way.
>>
>> May be we should have a devtoop blacklist variable that can be added
>> to the recipe
>>
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> > ---
>> >
>> >  scripts/contrib/devtool-stress.py | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/contrib/devtool-stress.py
>> > b/scripts/contrib/devtool-stress.py index ab77a2d..5f396aa 100755
>> > --- a/scripts/contrib/devtool-stress.py
>> > +++ b/scripts/contrib/devtool-stress.py
>> >
>> > @@ -210,7 +210,7 @@ def main():
>> >      parser.add_argument('-d', '--debug', help='Enable debug output',
>> >      action='store_true') parser.add_argument('-r', '--resume-from',
>> >      help='Resume from specified recipe', metavar='PN')
>> >      parser.add_argument('-o', '--only', help='Only test specified
>> >      recipes (comma-separated without spaces, wildcards allowed)',
>> >      metavar='PNLIST')>
>> > -    parser.add_argument('-s', '--skip', help='Skip specified recipes
>> > (comma-separated without spaces, wildcards allowed)', metavar='PNLIST') +
>> >    parser.add_argument('-s', '--skip', help='Skip specified recipes
>> > (comma-separated without spaces, wildcards allowed)', metavar='PNLIST',
>> > default='gcc-source-*,kernel-devsrc,package-index,perf,meta-world-pkgdata
>> > ,glibc-locale,glibc-mtrace,glibc-scripts,os-release')>
>> >      parser.add_argument('-c', '--skip-classes', help='Skip recipes
>> >      inheriting specified classes (comma-separated) - default
>> >      %(default)s', metavar='CLASSLIST',
>> >      default='native,nativesdk,cross,cross-canadian,image,populate_sdk,me
>> >      ta,packagegroup') subparsers =
>> >      parser.add_subparsers(title='subcommands', metavar='<subcommand>')
>> >      subparsers.required = True
>> >
>> > --
>> > 2.5.5
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

