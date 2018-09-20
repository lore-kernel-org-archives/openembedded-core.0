Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D83D745AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 10:00:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8KA0WM6000088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Sep 2018 03:00:32 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 20 Sep 2018 03:00:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1537358370-3557-1-git-send-email-hongxu.jia@windriver.com>
	<78fad439cd03f6e9be71a0a917667bcf94ebea51.camel@linuxfoundation.org>
	<526c8d02-733b-0345-f68a-52004c62817e@windriver.com>
	<3310e627615370184fd7a1a58997b516ce36f2a7.camel@linuxfoundation.org>
	<c08fffc0-87a1-8ef4-3e3c-7f8e9212852b@windriver.com>
Message-ID: <fa4b4923-9c3c-6e95-202c-24ea9222bff1@windriver.com>
Date: Thu, 20 Sep 2018 18:00:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c08fffc0-87a1-8ef4-3e3c-7f8e9212852b@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH V2 1/2] openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
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
X-List-Received-Date: Thu, 20 Sep 2018 10:00:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月20日 17:44, Hongxu Jia wrote:
> I am digging into kernel
>
Comparing with qemux86-64, qemumips, qemuarm, I am afraid the
qemuarm64 kernel lack of

CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_PCI_LEGACY=y

//Hongxu
> //Hongxu 



