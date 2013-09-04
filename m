Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 407EB6C083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 15:22:51 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id fb19so505389obc.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jLVm+y+vIuI23LzBlfYxLcNIqRjQgDK3itASBGRT+us=;
	b=jRaWQI+jrdo69LQobautj3of9ddt1HwMA+xJNG4tPoQRHYI9BtCgv1m4L2wjRz/nRU
	M158W2BSFMKN948yv8kC+ZglZ/riB1l+s9JJwrkURIVXfsCNBRdOlHw+4pT3Y/NgNjvH
	LcPm53UH1vfU69jhhX/j8ZhDtw6PWHX0ute2sDB5B3PjHCYCeZYRPV6cnOlBBH84p4TZ
	JnjH6Aa7C8fuGjChG/R8IQKYqr+jdGIdlJU0jBr/EWQYdlfFlRghvO6UdaBOKohCEtOW
	q2m4D23HE/cHPrZGhFi7T5QpcG/LCA1YgUTpU1ZMISMpX9vjBn3GtcxsbM1JwM3vrYyw
	fsIQ==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr2555552obb.63.1378308172792;
	Wed, 04 Sep 2013 08:22:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 4 Sep 2013 08:22:52 -0700 (PDT)
In-Reply-To: <52274F60.5090603@mentor.com>
References: <8563861.p8X6iV9RD6@atv-pwoegere-l3.atv.mentorg.com>
	<CAP9ODKqZZtbthB479VE6Xeso47YUQmtLBbnN=cudDF0YKLe-rw@mail.gmail.com>
	<52274F60.5090603@mentor.com>
Date: Wed, 4 Sep 2013 12:22:52 -0300
X-Google-Sender-Auth: -BEPcXvbCb4HQvMDdq3bVlNkjKw
Message-ID: <CAP9ODKq-c24EYcSOvFuzQpLrZJygiJ-8Mr3kHE6U6wC-wCA9hQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>,
	Saul Wold <sgw@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] lttng-ust: Update to version 2.3.0
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
X-List-Received-Date: Wed, 04 Sep 2013 15:22:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 12:18 PM, Woegerer, Paul
<Paul_Woegerer@mentor.com> wrote:
> On 09/04/2013 05:10 PM, Otavio Salvador wrote:
>> On Wed, Sep 4, 2013 at 9:51 AM, Woegerer, Paul <Paul_Woegerer@mentor.com> wrote:
>>
>> This kind of patch is nicer to send using -M option for format-patch
>> so it tracks the renaming.
>>
>
> Thanks! I will keep that in mind for future submissions.
>
> BTW, wouldn't it anyway make sense to change the recipes for lttng-ust,
> lttng-ust, babeltrace to the same scheme as lttng-modules ? Then we
> wouldn't need those nasty renaming anymore.

I'd be OK with this approach as well; it is a tradeoff as tarballs are
faster to download and GIT is faster for updates.

I think lttng are changing often enough to justify using GIT; Saul,
would you agree?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

