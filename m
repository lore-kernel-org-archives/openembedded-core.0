Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63EA560897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 05:17:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4L5HtH9014068
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 22:17:55 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 20 May 2013 22:17:53 -0700
Message-ID: <519B037E.5020700@windriver.com>
Date: Tue, 21 May 2013 13:17:50 +0800
From: zhangxiao <xiao.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <519AE3E1.8040404@windriver.com>
In-Reply-To: <519AE3E1.8040404@windriver.com>
X-Originating-IP: [128.224.162.169]
Subject: Re: How about separate client only mode from nfs-utils?
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
X-List-Received-Date: Tue, 21 May 2013 05:17:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年05月21日 11:02, zhangxiao wrote:
> Hi Experts,
>
> I find current nfs-utils just support client+server mode. No client only
> mode support. Yes, we can say the client can be used normally in this full
> function mode. But... I wonder if we have any plan to make it? I think only
> script modification is OK. To start necessary daemon for client side only.
>
Especially the rpc.statd that needed for both client and server side. Or we
can only use nfs client with "-o nolock".

Thanks
Xiao

> How about your opinions and plan?
>
> Thanks a lot!
> Xiao
>
>

