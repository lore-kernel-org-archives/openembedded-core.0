Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34A0671AE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 19:03:41 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id r136so1759536vke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 11:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vt4jCRwIjsEYvAUMWfk8BSGt/DlJMN+yPV2Q+qyfaOo=;
	b=e6YGGx0etQg5JFEdb35Kkja/JFbMhXW8YnPj9Etf9G3Ru04O9B8qZIY8bWEwcFH1kB
	UZDElym6p/dbKFxFRIvwzYBs31lwfrL10yZ8n9uSbs0FvdrTmPLSN+oa5EyAyqKgI8cM
	dIAk5dWp/9igXgFMWSG0GpFZHcct/jDU4hwTYV1VD1Fx9vIEWIPjpLes6kcC4j70O4BG
	4EEqcnwiIXC3tgHnSqp6EctiId97b8LGfv5/Z+62/F8PZvKbmwq0xzlRx7XpGvMAkMQQ
	DKuB+8J8/9JUjyQs3wZg231zLZsZTmJDf9W4iND+4tDe0gcRrVvrjtK4PDYDvGr+yhhh
	UALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vt4jCRwIjsEYvAUMWfk8BSGt/DlJMN+yPV2Q+qyfaOo=;
	b=e2CYzvZHeVTphuTxsyakyFjt/HsySz8fP3rBfs44OUqCMXoNeLPeSp6mqra8L50vdQ
	9JV6Cf9ALVgBgKF1q2dtf9XGYiyUFL7iWwk3YsjVr5TDxIRvweaE/jhgurQf+VrholOZ
	ySMzeqBTx9WO1OOb7/bW7JOZgV8PO523fHWsmMhgr2QQ5RfwvCdlWY4gJv0NJvIjhwa0
	ffNRmKOYjVDS+l3bhVVy3ed2UGd+CRXrbbSOBOqG3M8CdcFaDw8BhDlOoO7Xen1GysIO
	zm/5y6IjRQwfl6gKcmtk3ZmcT/YaNkAFxIfXbwRPU0IskJb5XC1MITYkob/weS1tDtP+
	QuYw==
X-Gm-Message-State: AIkVDXJF+O4R9V3iSw6urWwtTN8a1OMo+nHlc8HQNJag/JJHyqezXlTt7fCJQ1xftwnERXJXTLujUY+q2+U8Gg==
X-Received: by 10.31.108.149 with SMTP id j21mr24684679vki.93.1483988622096;
	Mon, 09 Jan 2017 11:03:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 9 Jan 2017 11:03:11 -0800 (PST)
In-Reply-To: <CABcZANkkR-xd+b0zCaY4bRVSPrcHS-LS1_MOBkF-dTdj23UYbg@mail.gmail.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
	<719dfc6d6e21c3493d0d67deab963e06f1897d6f.1483645446.git.chris_larson@mentor.com>
	<CAJTo0LYBOGw_KFb4+X=97FBmcUnc-uv-kW63ritDBkSMR0DOyQ@mail.gmail.com>
	<CABcZANkkR-xd+b0zCaY4bRVSPrcHS-LS1_MOBkF-dTdj23UYbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jan 2017 11:03:11 -0800
Message-ID: <CAMKF1so-BDVAif_frwL_kbEs+XC3mb5poEnfdCStWjBSK_jmEg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/16] boost: drop flags bits, fix for x32
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
X-List-Received-Date: Mon, 09 Jan 2017 19:03:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

it will be interesting to know some performance changes due to this patch i=
f any

On Thu, Jan 5, 2017 at 12:31 PM, Christopher Larson <kergoth@gmail.com> wro=
te:
>
> On Thu, Jan 5, 2017 at 1:29 PM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>>
>> On 5 January 2017 at 19:46, Christopher Larson <kergoth@gmail.com> wrote=
:
>>>
>>> +Upstream-Status: Pending
>>
>>
>> I think Inappropriate is more fitting here, but you're brave for daring =
to
>> look into bjam. :)
>
>
> That=E2=80=99s a good point, I=E2=80=99ll fix it on the branch. Thanks!
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

