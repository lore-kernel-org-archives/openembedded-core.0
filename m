Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9AB77178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:26:53 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n128so11681460pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=XJpuB8O/JyWs83Xq0RO196yG28lVY8J5z7llk/0cPe8=;
	b=MeYyo6+uJREVZHU/tC3CLVyjhAx9194FytMuBYQ/kBBw+9fzo7NnFYzXMUeT8JndeS
	S86rqEFRDtuoysQ7ZeWq85k9k72RWwqDalNiE/PPqrc3B8b/ot/ofsJLo4XimZrju7D0
	OsNYhZghi+YQMcMu0BvP/geC0+oUL/CiffXx3DgY0d6mSaWev4PEY2hEaGnuenBYc0Um
	7Do9ZKzANIbE2Mfru3soO0pz/eZsQOZPJ/+M+lW0sVjzlXijKS/I64ppTJxiDgs9nqTV
	De0QGBOOngltVyNmAtyEQ6y2YG2mMvnUIZ/GkZ0mZVLoThXBz9lSoX86IRjKlA3B/LMe
	Omag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=XJpuB8O/JyWs83Xq0RO196yG28lVY8J5z7llk/0cPe8=;
	b=hdXbw8WDZQXfytGB2FFHN5/f0zMrHmEo66+13U8u+RrXcesVrvsXid8qkw0mQjnQLo
	gH3QVBZhRUYal46CaOshNUjzrrvb+GrGH70VnyAHnJuvoFhkVxIlXCLeCmOOT7tLepoN
	7Ss/SsLf7t0eE4fr9aWuNpUInytrGtioWVJSxN33W+y0gFTY3ue+kDprBS862e02Q7jD
	F55IH8FOSS2qdm5f9ne58iKPqS5PpjztKD1t7+S3/RwXZUU2FIQS2Jo3N20Hudz6KxId
	IplR5c/HG+hCq92CSzehWrdiHtGOwXBJgZdxWdjHN8OUq5ex4EsDzpE5BYVf+AgPflel
	7ivA==
X-Gm-Message-State: AG10YORzBJ0NDjI72TRvqVDUhvY3MPgrTb/UuYBpfIQgrzuYSm+mWD9gqT1+okHH9Al1kg==
X-Received: by 10.98.13.85 with SMTP id v82mr45722764pfi.158.1453933614311;
	Wed, 27 Jan 2016 14:26:54 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:a963:c413:b391:5487?
	([2601:202:4000:1239:a963:c413:b391:5487])
	by smtp.googlemail.com with ESMTPSA id
	72sm11309243pfk.28.2016.01.27.14.26.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jan 2016 14:26:52 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	Catalin Enache <catalin.enache@windriver.com>
References: <1453890141-4213-1-git-send-email-catalin.enache@windriver.com>
	<CAJTo0LZe5rwfWJUMvbaavospzyqeNV-h5BgjoJ8uLfZUb_rVEw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56A9442B.3030204@gmail.com>
Date: Wed, 27 Jan 2016 14:26:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZe5rwfWJUMvbaavospzyqeNV-h5BgjoJ8uLfZUb_rVEw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: fix CVE-2015-0860
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
X-List-Received-Date: Wed, 27 Jan 2016 22:26:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 01/27/2016 03:29 AM, Burton, Ross wrote:
> On 27 January 2016 at 10:22, Catalin Enache <catalin.enache@windriver.com>
> wrote:
> 
>> +Fixes: CVE-2015-0860
>>
> 


I believe this applies to Jethro too. same version if layer index is
correct.

- armin

> Please use the tag CVE: CVE-2015-0860.
> 
> Ross
> 
> 
> 

