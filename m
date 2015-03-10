Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id D659A73A05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:53:39 +0000 (UTC)
Received: by yhai57 with SMTP id i57so2070744yha.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 12:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=xnw3IA0Ocp1UxJJXlZDUUzpDVSWFFRgEM5E+lQV6A0g=;
	b=dezSKth5LEMm4cDv2u8+P4uTA/VxEtX7weGpiGvSS9mPWw5dlD2p8uqrcDUhd+s6RM
	5TtSY47imDqaWsqNZBjVBBWnLZWROBNNBf5ju7W1dIDxBYLv3zk50PHyniAdiUFi9l/C
	o9CjgKV8wul7bcT7gqv6+Zx37YfwH8pZlkKogWmdMlwjpezWE82YX88iAgmGo1Vns602
	0BzlshEfFlt0zc3wyLVzoDYdoQIJiLA9ZhvWGqjkMBTtaIZQmv8tHOkpIR92teSyQdGH
	RHOPtyYBwNhqxJwITSFSsgzj0SQFSHXHxUdbUon/WVllnRLxlIB1F+4MJ0FM8i+WlC6A
	51WQ==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr34040244yhq.90.1426017220448; 
	Tue, 10 Mar 2015 12:53:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Tue, 10 Mar 2015 12:53:40 -0700 (PDT)
In-Reply-To: <CAJ86T=WcRjnrPt89mRyK_O80r5MyyjA6ifwJ+pGSDewxP+JsgQ@mail.gmail.com>
References: <1426009857-1224-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=WcRjnrPt89mRyK_O80r5MyyjA6ifwJ+pGSDewxP+JsgQ@mail.gmail.com>
Date: Tue, 10 Mar 2015 16:53:40 -0300
X-Google-Sender-Auth: YUqZzpb3h6bTTk1Cyrw3jdV81ew
Message-ID: <CAP9ODKpFX=p4Jr6eORVRAA0vmD+8dRiZhMz00=YPCDQVT_UsbA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devshell: start in ${B} not ${S}
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
X-List-Received-Date: Tue, 10 Mar 2015 19:53:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 3:57 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Mar 10, 2015 at 10:50 AM, Ross Burton <ross.burton@intel.com> wrote:
>> When S=B this is a no-op, but when B!=S this means you can run make and so on
>> without having to change directory first.
>
> Just my opinion, but I'd vote against this change. Running
> "../temp/run.do_compile" works from either directory but editing
> sources and running "quilt refresh" etc only works from ${S}.

+1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

