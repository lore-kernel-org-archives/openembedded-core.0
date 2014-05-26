Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1EDC36B7CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 11:10:57 +0000 (UTC)
Received: from [172.16.141.140] (172.16.141.140) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 26 May 2014 13:10:57 +0200
Message-ID: <5383212E.1030203@enea.com>
Date: Mon, 26 May 2014 13:10:38 +0200
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Wills Wang <wills.wang.open@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <5382B78B.8020200@gmail.com>
In-Reply-To: <5382B78B.8020200@gmail.com>
X-Originating-IP: [172.16.141.140]
Subject: Re: How to use SDK/ADT to generate the ipk/rpm/deb file?
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
X-List-Received-Date: Mon, 26 May 2014 11:11:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-05-26 05:39, Wills Wang wrote:
> Hi,
>
> I want to use SDK/ADT to develop application, but i don't find anything
> about how to generate the ipk/rpm/deb file after compiling.
> Is there any way to do this?
>
> Best Regards
> Wills
>
>
>

Hi,

There is no common workflow to do this with the OE SDK, across package 
managers.
Each different package manager has a different setup.

For ipk, http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/ might be 
helpful.

Br,
David


