Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 936D96FA94
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:41:48 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so4650707yha.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YVW38EJpF3jl0nq+eac3n0tk0abRRi0uOrzPnhJZyzY=;
	b=oJk4/7HmLEBF/ut8APUrD2/oq1566enDN/o+58oa1ZPh80ogdRmIHbCqT9I/c9G+07
	Lz7AytrX3FeaE/oITHlpJhozczZIRDGcpouvOvtashm4ah7IOjj62mCgC7fc9HzNlZ7p
	bnyW7SklkGIYoPDUMKsxA6ZoFL2rKa7odocdycgV07fe6F7ZYeQcJqlyogoz9ibmspGU
	H3OqmfNR/OGUb+ye1ci1DFfNtdNCMgqSz/VPt0Gxre2FOM7Pk49wfLypRop5z/8NbFg/
	h7at4vl+VWKe68n7gZdBnyLAlcV+fVO+oD7lg/1NvBhgq66dAXHO5NwwXGSSpE4S9UJU
	JaBw==
MIME-Version: 1.0
X-Received: by 10.236.29.171 with SMTP id i31mr42540650yha.37.1407181309292;
	Mon, 04 Aug 2014 12:41:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:41:49 -0700 (PDT)
In-Reply-To: <13060467d5be9274cbe18b3791bbf10f5a2d7abb.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<13060467d5be9274cbe18b3791bbf10f5a2d7abb.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:41:49 -0300
X-Google-Sender-Auth: 8a0L04HTD-kZ9Sudl4r_Uau-7aM
Message-ID: <CAP9ODKrG3dvq5JZo7jRXuwvdVxADXXVgq4vkR-nLwJThko42yA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/20] udev-cache: Create cache asynchronously
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
X-List-Received-Date: Mon, 04 Aug 2014 19:41:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:41 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> Don't hold up the boot while the cache tarball is created.
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>

I am not sure about this one. I see the value you are adding here but
I worry how often something can be connected during this process and
change the contents along the way. Did you see something as that
during your tests?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

