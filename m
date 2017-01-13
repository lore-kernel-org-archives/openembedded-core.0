Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5E671DA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:02:22 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id f144so34489468pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Cb00qjRk1VEnR1caHMQoAl7g9g58AyWlpqudDb7sPdw=;
	b=gPUMl24luxyyFe4evUDC1gqly8uLKosR3rpKREQIgoJ/ILrgDStnfRsPyy2ttNN+MO
	8SjCFYJqE+AbhRIULvitrqQVpbGcLyVkcyTeA/euRlyiTK6XzN/Xaa2jK+CNUjRkMg2b
	11HlX4qw7yQVlL41dMeBGRanNrZO3LHSqPPS2he9gFW8/mga1D6BH8Y8ArdUxLh896o+
	xkMPsPuGqUYSCNWcIUl9ojlYQNd2fXGowcPuYiEfDJHPVn3ZhY/3cojFRackEjs0HduQ
	IiTf7OYLuB9HeXaEOjaKJ5nCI4PX0c3pkJGfSEv9ARDJm4dImHK8wWT6nco9GCsjisQl
	0zlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Cb00qjRk1VEnR1caHMQoAl7g9g58AyWlpqudDb7sPdw=;
	b=igIRl2A0KlhIowkYDeDu2/C2fWYnhAk5dUQlHK09cr58lrWaiR3ho3+uBSTmgbFVbF
	4iOBSzhPyovZNs1R510OTMsu5kxj1nJGBu+8DafGxMxXFO5ezoETMWOAslkKHdIpCbwg
	0DGBkJdDOz82z+HDfw6E+NI9EjaLetzmcCYIGGCSSQAk1jrIRftYbcBarlLYfobM6QIm
	4d4OiY/GkNXx3cTLFLO1QzWGKbiZyiCPdfkW6RnD/KurAAckuQRANOhAGptivFmMuTQm
	KjjfJhxOeKHd6gtykySLupGOU0I7yRS069mkAOr86jHwyVbTukdxRZSjUOcd+3oXv1yf
	XOIQ==
X-Gm-Message-State: AIkVDXJiMcGQkz8UmbKw+4XQhs9qylWy+wW5ml/yKK4lJl6kKJJY/644eboIVywCs3hQKg==
X-Received: by 10.99.237.17 with SMTP id d17mr25943934pgi.82.1484330542910;
	Fri, 13 Jan 2017 10:02:22 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:4198:472b:7988:3451])
	by smtp.gmail.com with ESMTPSA id
	q5sm30907723pgf.45.2017.01.13.10.02.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jan 2017 10:02:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1484330012-11592-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3c68d638-ed3b-429b-2090-df53161b40a2@gmail.com>
Date: Fri, 13 Jan 2017 10:02:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <1484330012-11592-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
Subject: Re: [PATCH] python3-docutils: upgrade to 0.13.1
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
X-List-Received-Date: Fri, 13 Jan 2017 18:02:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/13/17 9:53 AM, Edwin Plauchu wrote:
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=a722fbdc20347db7b69223594dd54574"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"

whatever is causign this change in checksums, document that in commit
message

