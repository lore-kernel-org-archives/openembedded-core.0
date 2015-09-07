Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B15CD7669F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 07:09:51 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so72357260wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 00:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Xxq+bpDbKOy0cag9vUtSsnZuiv4DnFhX+OCqBIdH2Fw=;
	b=CslFZe6fKHYfv72Eo4c30YXOQUcWVefeJGsho6PcmE5rElQtZkgH3CTvDykTYTkytv
	TEubBIB3jWpbDFmivGxurkNcpc3ar/j+8e83X0zEQYCGMnI3NZ87PIap0y9dlTxzJuEH
	Fi4vPmqGgXdfeceWcJENJMRjkU6ldH54MmOnSzJQu6rG5K2Nf2gF+BijXyRx1pahq5WW
	CEk3Nm0xA57RAt5eAAUxUdNhVvYA/86jujcPWtKXHxZI1NqyAszTQvoazNk2OcaOFF/k
	Apc1yD7mviilvf6HPNy1oCTdKsi8xwVSTcV42RB9GadT/VjSgZ/o/2RpnQb23gswvYz5
	0iYg==
X-Gm-Message-State: ALoCoQl/CDeSEEszwvX6DAm4BbDIxyFNs3BtezGgLxR63SkmGT9EEsemmT17TtjqguZKNopWh0S7
X-Received: by 10.194.85.163 with SMTP id i3mr32750724wjz.75.1441609791214;
	Mon, 07 Sep 2015 00:09:51 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	n15sm11214084wjr.14.2015.09.07.00.09.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Sep 2015 00:09:50 -0700 (PDT)
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <55E949A4.9050805@dresearch-fe.de> <55EAD217.3010806@topic.nl>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55ED383E.6070005@dresearch-fe.de>
Date: Mon, 7 Sep 2015 09:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <55EAD217.3010806@topic.nl>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Mon, 07 Sep 2015 07:09:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 05.09.2015 13:29, Mike Looijmans wrote:
> ... and I think the u-boot recipe recently learned to have multiple targets, so you can build multiple bootloaders for a single machine too.

That sounds great. Can someone give a pointer to some documentation or examples for that?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

