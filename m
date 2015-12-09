Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBD160767
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 08:46:08 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so249714446wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 00:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zDMT40evxH1RX+1iSfOfFHmeMXs1J2Yoo6aQKuDa4SE=;
	b=dO6wgKQOYoxs8bwHUcsXwAxAz3tRzeoudBfSoELbrFyD271Lo2O56M9m5qnMD9Dcn0
	c1hHUiP0uosZDUatPQrdEMidfpW+M4+aFX4XI896L+w1n67zMV3+42RZrR65MerUgpvG
	XPoeGqAoXdvPtvANmzGyFf4hmj64anD0XjV2/7QZ9RPuJ5OemowBgv6syElHcJcAW/Ma
	Hd5NgjINBK8LmyGYYLPlN7igJ6mPXGSUs4LRo7IXfMiMBWGL/ixwJCqSZ5wNPGR4fbw0
	DUgth7ur3xaY6TV2vfrATFLRh5My9fLwfIWmsXqMrG1CwVH2y6u7Gb4F0Q7ir81nqI/q
	wbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zDMT40evxH1RX+1iSfOfFHmeMXs1J2Yoo6aQKuDa4SE=;
	b=FvxJeDXf2XmMYKUwzcM3xAvW/UbxW/i0oKcKg8mlzIpAyO3woKZbMtjgwwyMIEWd7q
	q6UODo749EWKXuc17/U5Im3bkCfJd2OM48bfqje8O6TqhAwJ3oiwMdi4tQPoVaRnoAuK
	Y8AHOoIidW9eZN3zt+cFJrSTpXtZ8hucj+xlG5RcSQ8P8S5oF076XGv1Og5bJhzDQMM+
	msusSqa1qClxYzKyWonthLP/1EjP+8tvF5FjXvBjyM8HlT9M8VEKg9dII+cSJQKTf8Mx
	+u8kYfe2EYNDRWNugkdauq0xCGAa+HdxfUNDXvrncivAGjf0Zi2DlwfkWNJJ5bVtnDz2
	+Klw==
X-Gm-Message-State: ALoCoQk4jt5mkaiXMzjx+HSbmtgrHo72MA34+YdVW3MOwXryXTjUnKzFdnOWF/sJ2P1qzeCy2bKc9ij6Q58gyQsJqWynvA2zBFmOTDXYCA4kPsnBgbOlHKs=
X-Received: by 10.28.57.65 with SMTP id g62mr30574991wma.65.1449650768814;
	Wed, 09 Dec 2015 00:46:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.184.110 with HTTP; Wed, 9 Dec 2015 00:45:49 -0800 (PST)
In-Reply-To: <5667C7DF.9090903@windriver.com>
References: <CAJ86T=Xg9mE5MCKL-w=6O+LUZAv5e-iOeTX9Rgto4LVhS+Xoww@mail.gmail.com>
	<5667C7DF.9090903@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Dec 2015 09:45:49 +0100
Message-ID: <CAP71WjybAZL8DvS_-ybeWvC7SAMzMGpsRXwaWduhJezHcaGCAA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: jethro backports
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
X-List-Received-Date: Wed, 09 Dec 2015 08:46:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 7:19 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 12/09/2015 12:36 PM, Andre McCurdy wrote:
>>
>> Hi Robert,
>>
>> Could you please consider backporting the following fixes to jethro:
>
>
> Got it, thanks.


shameless plug :
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/113501.html
;-)

