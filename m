Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfUm5-0008F6-Cj
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 13:05:25 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Dec 2012 03:51:02 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so12380093iea.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 03:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=WzYg3OOMtZVuPAg9R8xBZIIYpPIRtBV3FU3DcSfIPcA=;
	b=bRg4HRb9Xfs/+NRfu4t/0yCi1f1QPuShCaOB+Xa5SZinEPNei6lTnQx1AFzjSrZFAF
	vQFWsYhr6SBClcd8//CkoIZUcdreYg9Wop8injwSHiMbDhmOwHXIkS4dX+QU37JEcaGb
	J5jqWkuUg1r+SYjq3IVJaPu5HnfpzKtw9YyFxUiIdIcR3bBS0tyWnrjjs3dymownlmEg
	8VYkIOpXMEGbvj/L8KybMdbNjQWQUAIVxkUcylOsqn/03KB6eamp3pFu7DH0TAhNY/Nv
	gdI5dolk9lb4998DkA3yohqUXFinIRklnVJaS4OSC3qKElo9jq7Xfqvmtw/icttssGgK
	fxbQ==
Received: by 10.182.54.103 with SMTP id i7mr4071663obp.62.1354535461975;
	Mon, 03 Dec 2012 03:51:01 -0800 (PST)
Received: by 10.182.54.103 with SMTP id i7mr4071657obp.62.1354535461898; Mon,
	03 Dec 2012 03:51:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 3 Dec 2012 03:50:41 -0800 (PST)
In-Reply-To: <4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
	<4973f2f88641f8a8c02b0062b31f159977d9ba0a.1354531187.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2012 11:50:41 +0000
Message-ID: <CAJTo0LZOOuZ7RJ+f+hXPckxRrPr9CU8c4KPT5sgSSo1rm7q=eQ@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQkIPfHIgRyXfp+mJH0Uro5pvk282tYv4TgctNb8FGenw9sCSxWPlC3rpg0Edlz+rPq4btZ2kmZ7FtkHMeKAZl1xJy9yvaObRmYqTz1koGi8iIs41T5U21hUcKG0bbR43ADy8+KdSNH9fT0qYFx0SmKD1C9hSzzl30tDhdc2MbCiioye+tj5AphaH0E3TG8AzY0kZf7Z
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] ICU: add pkgconfig support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 12:05:25 -0000
Content-Type: text/plain; charset=UTF-8

On 3 December 2012 10:42,  <Qi.Chen@windriver.com> wrote:
> +ICU-3.6 has no pkgconfig, so I add it here.
> +But ICU has had pkgconfig support since 4.6.

Is there a reason we can't just bump oe-core to 4.6?

Ross


