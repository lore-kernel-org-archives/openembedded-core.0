Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09AA1601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 07:52:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9T7qopt019419
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Oct 2018 00:52:50 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 29 Oct 2018 00:52:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <1540546971-36870-1-git-send-email-hongxu.jia@windriver.com>
	<1540554599-37191-1-git-send-email-hongxu.jia@windriver.com>
Message-ID: <702cdfc5-5a03-ec83-413e-bab303d164c7@windriver.com>
Date: Mon, 29 Oct 2018 15:52:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540554599-37191-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH v2] go 1.9/1.11: fix textrel qa warning for non mips arch
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
X-List-Received-Date: Mon, 29 Oct 2018 07:52:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018/10/26 下午7:49, Hongxu Jia wrote:
> +python() {
> +    if 'mips' in d.getVar('TARGET_ARCH'):
> +        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
> +    else:
> +        d.appendVar('GOBUILDMODE', 'pie')

It should use d.setVar('GOBUILDMODE', 'pie'), V3 incoming

//Hongxu


