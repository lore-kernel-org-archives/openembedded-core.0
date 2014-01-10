Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2DE60E5A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 15:51:53 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl1so19392373igb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=gJQUeu4pRZkU0FsCGgTXP9dQVrC3oqB5zABmDjXb2dg=;
	b=bnUMKu26+RCOEP+Nq+HgKnXUIgK02vjr/GEGSsWWKirZKTPLWBPDxEMWHm4acsEnp1
	ZNl1WjPqmCFCiNnYMPgg6ZXE2SmVFBIZ+8dlTtNNliScnutvmgB7i71G7bmXFyTBEidQ
	/nAjbrD6o/midgsXLV7CCn6Z8O6ZDT7xQrJOfTiy2/hkMUhEoaTcyQdG7zs5V6Zt+UEK
	70FuPmI+IUgB1uVrZ9AH67BUbjhtIkcxaL1bENSsJcCY1LuDBFH/A3Y/l40ihWT+hJ9N
	pjXCBptXFDPV3K3ZzG96+x5XXsdZKZva0u//InasC/Q2SigR3HABjVGXzOEUI01jZNy7
	aPTw==
X-Gm-Message-State: ALoCoQkDe2SeHyW1Mm1l9kTq4aZ3uzA75PnoMeXrst+M+VQNmf9VXTfWMbgqLjvEBrkAHl1sLJqI
X-Received: by 10.42.230.73 with SMTP id jl9mr8618003icb.26.1389369114322;
	Fri, 10 Jan 2014 07:51:54 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id a1sm3168894igo.0.2014.01.10.07.51.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 Jan 2014 07:51:53 -0800 (PST)
Message-ID: <52D01717.605@linaro.org>
Date: Fri, 10 Jan 2014 10:51:51 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
References: <52CEEE43.1090209@linaro.org> <36564971.Qsvan2fIrZ@helios>
In-Reply-To: <36564971.Qsvan2fIrZ@helios>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 15:51:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Paul,

On 01/10/14 09:01, Paul Eggleton wrote:
> This is all very interesting with people piping up that their layers
> are maintained, but I'm not sure it helps solve the overall problem.

> Also, if it does appear that a layer has gone "unmaintained" by
> popular consensus, what should actually be done about it? 

I was hoping I could put together a list of the layers which are no
longer maintained to see if we could find people who might be interested
in stepping up and taking on their maintenance. Or at the very least,
clarifying a given layers' maintenance status.

At the last OE TSC meeting the issue of unmaintained layers was brought
up, I asked several times if people could specify to which layers they
were referring, but nobody replied. So people are concerned about layers
that have no maintainer, but nobody can say which ones (?). In my
opinion I thought it would be easier to solve this problem if we could
at least start by defining it.

As to what can be done about it: if a layer is not maintained, and
nobody cares for the layer, we should drop it from the list or at least
mark it as such ("buyer beware"). If a layer is not maintained, and
people do care, then we'll need to try to find someone to take
responsibility for it (we should, at the very least, make the attempt).
Also I think we should identify layers that people do care about, whose
maintenance is questionable, which are not hosted in a way where the
community can apply necessary patches to easily.

Best regards,
    Trevor

