Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 22FEA7F214
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:41:59 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x134so10441472qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qp75G6dkts/IAH9Zq1NgGjSH79yvhyWC4TaoHF6xY/4=;
	b=DOcUR4GB64pzR3D6TDxGV5b80lq5tACWRYb+Xfo1Frq3kQcXX8AzAxoYyy2CiQn5l1
	GO4M5dmF/B3QhWcyJjblBALlroNiSkK+ZoVvodezMW6g8AuCxYRM2JD6cZzE0b8e11X3
	W69V0O7YDjqjQNUcSfMie6BFZjzZXqoELZY4S8CGZW/V7JPj8z4eIecVPMkMzI9LnKr+
	yksKggoazhq1h4QEUHqVMcXuWbQDJkOKhE0FzHV+mj7lAQEkw8FvzPpSN5SvAwQDcBNl
	jUM4RKEOSInBHaSU9g4pPQWRX/JrHkbZxY98bv1G+/Tosi5Zwb6QY73JZkSb6SB47rWw
	1Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qp75G6dkts/IAH9Zq1NgGjSH79yvhyWC4TaoHF6xY/4=;
	b=MKHVusWORXgUIY+Qf7tQeMN8yEG6FXKaWj6Vs59kYVjjr3XnvnzlWhW6CdP0RFJGHL
	BxvzEGRzDxbZiG97mNuYpupgwXh+d12t9nkASjEZhLNx+bFJkdsaAtmWRg7JO4IiTsNp
	9RObRf1cXZPCRatg8lYBNZXDzkrynIZQHNHIAE4wxT9QjMi+Q27fNzN0hr4pKDN47R4F
	qw6TmtRmu96kbUEB8X0hJe3TF5YNIy4YWTkl68BEXoenCaVFDXItcddbG6+b3FXw+N8R
	/Zvvk42kWUtGxqFmoEBNyyWi7ApmTNUTVXpFOTt7YiTx8nWHrj+NMz1K2Eu/Y6fiX7Nx
	WM0Q==
X-Gm-Message-State: APjAAAU8bR2oKSjjs6Yw67Wv7rSJSQEgclGEcoLPsiKqnVEZcwqh6O4t
	RRkpx7TQbzPxX1LcuUkJIdVUNG2Eml+pvxPJRUQ=
X-Google-Smtp-Source: APXvYqyThbHZW+PHmCZvB+D7SS136KGGvdawpL8t3CqPobCqFsgNIdhdcJKya+t4C2xnAjLA+Vr6wXNUsWoeOegst7k=
X-Received: by 2002:a05:620a:1466:: with SMTP id
	j6mr21901436qkl.9.1567622520518; 
	Wed, 04 Sep 2019 11:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190904181009.8374-1-raj.khem@gmail.com>
	<CANNYZj-P2egu6X8-kVFKnNk_NHk6Z6Pme8BQZfh=AbCq-NJggw@mail.gmail.com>
In-Reply-To: <CANNYZj-P2egu6X8-kVFKnNk_NHk6Z6Pme8BQZfh=AbCq-NJggw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 11:41:33 -0700
Message-ID: <CAMKF1sqz9qj7q-7wLMTmM-szgra2-PM_ym0_rFd8GPWQhD+ORA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python3: Expose PYTHON_BINABI in global config metadata
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
X-List-Received-Date: Wed, 04 Sep 2019 18:42:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 11:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 4 Sep 2019 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  # llvm version being used, so always bump it with llvm recipe version bump
>>  LLVMVERSION ?= "8.0.1"
>>
>> +# This should be bumped when python3 recipe's MIN_VER is bumped e.g. 3.7 -> 3.8
>> +PYTHON_BINABI = "3.7m"
>> +
>
>
> This is already set in python3-dir.bbclass, so please use the values from there.
>

hmm thanks somehow I missed it. I guess defining then in terms of the
values from python3-dir and python-dir should be good.

> Alex

