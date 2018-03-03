Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id AB3C471A74
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 02:45:37 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l131so4520209pga.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 18:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=J8bR5sD9rXB5thTn32J9R00jeBlasVhD1wwSrKo8xbM=;
	b=mOW+QYEe+oHO3a8B7NHkXwAgWfkKPRrjSQOUHwb4NA2IglOB9Ty6RzKimOPTChpHLV
	wlHJn4R50ie5kjdjn5/YXEAuJVbZqpIMRmXxkJ2rlk3I9GbR1IbiyhHVaRhs3ip4BSo6
	Br+teDaF24WQZggmS30GYe4Aiz9DgqnF8QnY83y+LYrsKTEVi4824xVp/p9cf/sGGPqz
	yggoBruHOYQVi5517We3vMXJGE4F3UIQ6qwMdltbyoVcqbb8lK4iucUjNqIf9dMm0L/i
	Rwp/WCrZxdXP7iHyWXCr/g6xDurXGNj534QZ/Z7qEa9dXCJ0Mw9WkR8YQPvGF+qnybz+
	2iLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J8bR5sD9rXB5thTn32J9R00jeBlasVhD1wwSrKo8xbM=;
	b=W8evwCwXEYVXO1QQa91gcBlSPxmhVHcgIQLPez/2LYhHrbLVtZeGN0PVkMR6TJz41l
	yjmtnz1Of5Q92G9chZThi6D6upwRN7K0Rj8nlJatWvI9EMOdk/ZJr0zQcdFVNoV1L3pB
	0aqqVgekRmJ+hmBGSjnDlSzPFJow4kpb+gwOrMBkIHdI/tDF9BvjNM1nUOZEY9S4oU/X
	0RHeMuJgq5x1vJFekHMTxGqPvune0qc42bscKP+G1B+i4J0pS3ftrWxwgkpXn80tA34f
	3FkRtZnb5r/oNTkOBzRqhJEw1gawe9KKu+4k4tFRFfIxO8OfYb7UGlZOwZOEl1vqJj+D
	oaHg==
X-Gm-Message-State: APf1xPBbkzfXNzOileuGNwf2oJZozq1Ez5JEXGMNzu0HnGiznLT9FQbJ
	9tF6jOxEYfpQ6xm9XTh/AeEbFLnC
X-Google-Smtp-Source: AG47ELuz6Y5YeHtIdWGPgQMYrLSJpLiMcGj4JN3jlts6rEi8izDzT+Y1HacFft6R0wI+S96I94iIzQ==
X-Received: by 10.167.129.67 with SMTP id d3mr7643861pfn.108.1520045138204;
	Fri, 02 Mar 2018 18:45:38 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:a564:75fb:6e2a:d708?
	([2601:646:8880:466c:a564:75fb:6e2a:d708])
	by smtp.gmail.com with ESMTPSA id
	y18sm13500101pfl.146.2018.03.02.18.45.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 18:45:37 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<17b1cd0eb9a731bdf5049a60bb8efd00614f8edd.1519797175.git.Qi.Chen@windriver.com>
	<46823155-8640-e1a8-abd3-3096c42db362@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e75690b6-7de8-cfdc-547b-7c35afe835ff@gmail.com>
Date: Fri, 2 Mar 2018 18:45:36 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <46823155-8640-e1a8-abd3-3096c42db362@linux.intel.com>
Subject: Re: [PATCH 2/4] systemd: upgrade to 236
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
X-List-Received-Date: Sat, 03 Mar 2018 02:45:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/28/18 3:41 AM, Alexander Kanavin wrote:
> On 02/28/2018 07:56 AM, Chen Qi wrote:
>> Upgrade systemd to 236.
> 
> Latest upstream release is 237, should we use that?
> 

I think yes thats a good idea

> Alex


