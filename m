Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2B89F6BA77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 13:50:07 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so1032228ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 05:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2sIR03TxHW6iTQOHVjLtre+knm2zf+6wR0dGjFR0I1g=;
	b=wLGmmkwERL/ql3Ez9oPQ4fk72C6bue+4Cbgag+v8KvO0LJIdUu2VLZ4KAZc1BU4XA+
	57ZDff08vp5Q45QPSwgg8inRhwgvxddPkCMuJikGUVTvAEXmOPc6Qe62bTPqSiwUqtRv
	w+xvkS1RZweOebEu2uy3Rl9SrY6L6SJr0Dds3Rv0ZP9FwNLeM1jEXTj53WdtE723ZrRd
	olAehhgic17orCuiwhzQb5n5TJligNKXsZwyG/pJs1OKlcnei0KaM5aAqDakyoMU/m5J
	I1KqzqfgD5Um/DVIefuV3W0p91EfvPiIQ+q2zwvycmdnjIaIQ/q5PWzPYuluStZrpNIi
	S9TA==
MIME-Version: 1.0
X-Received: by 10.236.118.212 with SMTP id l60mr6328208yhh.78.1393336208539;
	Tue, 25 Feb 2014 05:50:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Tue, 25 Feb 2014 05:50:08 -0800 (PST)
In-Reply-To: <CAMCfZKG7ZQUdaFJ8MfCyyKR17p0w=MagQNMNeZR9cGTmiMasPw@mail.gmail.com>
References: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
	<CAP9ODKpGE22EOaUgqnaYGF47dsidsAF5_zFxUdNz=EzfSeQOWg@mail.gmail.com>
	<CAMCfZKG7ZQUdaFJ8MfCyyKR17p0w=MagQNMNeZR9cGTmiMasPw@mail.gmail.com>
Date: Tue, 25 Feb 2014 10:50:08 -0300
X-Google-Sender-Auth: xqKoGU-6sJG7m_SsLYHeeo5934U
Message-ID: <CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Diego Sueiro <diego.sueiro@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	"Eggleton, Paul" <paul.eggleton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 25 Feb 2014 13:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Diego,

(adding Khem and Paul in Cc)

On Tue, Feb 25, 2014 at 10:35 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> On Tue, Feb 25, 2014 at 10:24 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> This license is the same of Qt itself so I don't think it needs to be
>> quoted here. Do you see any reason for it?
>
> I've just followed Khem's instructions:
> http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089888.html

I see; however this license is no different of rest of Qt so we can
assume the user of Qt knows the license (and has reviewed possible
impacts of it with their legal department).

What others think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

