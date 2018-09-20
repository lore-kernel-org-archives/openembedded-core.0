Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4E9279866
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:13:50 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id q7-v6so4973238uam.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 12:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ayq7cggzQemlkeLfuXBUQBQm4Pu7NqglCeAKBXsM9+8=;
	b=UfANsOxzU77oBxt0ft/Qz7ncmWtz+81jLAL6mNrINuhIe28G5hDPKDj0OKAGs/bA28
	ekrDeKLI94ocNclE9cK9j1jMwrSspxQJmVprmk9PfTHoIJnYKqCg3zGc2wDtWXGT+uM0
	J3jjr709ulBVsTCPBGv3PKmrox/UZONrRWS6Hu9lDVSa4nOIkrOOXT5k2WthvJW6zxgR
	yGS9TkQqTBF2EjdtppCxzs7NdHg35h0tgz+xZdlmq///DsptnOEGD9o93s/FBackjQne
	EoxdiG+N1xSZ5sPQSDaVMVRx3YpgyZ6OltSviHCztdSXQ4kwpIXyOoNqGo/b5WBvb0C2
	j0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ayq7cggzQemlkeLfuXBUQBQm4Pu7NqglCeAKBXsM9+8=;
	b=n1+qnuPSdHgsTxbI+5sP7Z+D3Wevm+Nx+/9yXKSOZzpmBfEPjNsl2jF2+STBbSWN+u
	fXuU3m0dbf+BmHJNBLvTUUlITJSlr7vlimgWh2PYKcBJNJYLsOFdW9kDl59ktLVFHpl7
	59yWDdpA022gqdUuwDcwRSFRYrHhZuBzmHhl9ZA8gMNQgEgEGB4ayGX8ThgpJUrOXFLT
	uC5ybhnEixIJxLRkOJvUA7BztEwQ2hxvvqoRgE5wXpHzZk4ExtchpsM+eHJLdkMBp438
	yVK17EFzT0LhOKbDcCgyyHi/KHjIwptespMTXpyo6spVMcJaO1JMPi8DSD9OdLBlWVDh
	FkkQ==
X-Gm-Message-State: APzg51AdcMDlUBTJTUN5M4YXtsMRQxUTYDOUhmsyw6Qhh0SwDtGjYXoZ
	zGoTsy0h/J+E0hKm3X7WnzAH33gwiZmNH12CoR69jQ==
X-Google-Smtp-Source: ANB0VdYgbXmHBQDKJ+Rvp8CNRTw9JyNx13ur26rV9B9kEsuPtl9eyD0eg/lOUFRho/YV/MK3Tw8g1pVf5aq2m7mv0gE=
X-Received: by 2002:a9f:3826:: with SMTP id
	p35-v6mr12141469uad.42.1537470831382; 
	Thu, 20 Sep 2018 12:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 12:13:50
	-0700 (PDT)
In-Reply-To: <20180920190749.vzhy3vbpfel34vk3@swift.blarg.de>
References: <20180920183259.29310.24354@do.openembedded.org>
	<20180920190259.13842.60331@do.openembedded.org>
	<20180920190749.vzhy3vbpfel34vk3@swift.blarg.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Sep 2018 12:13:50 -0700
Message-ID: <CAJ86T=VyGD1BAUouZ2UTxS8Qa1AMn=QvVbBdbqQS4n8dXkg=Gg@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2g6IG1ha2UgT3BlblNTTCBvcHRpb25hbCAocmV2Mik=?=
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
X-List-Received-Date: Thu, 20 Sep 2018 19:13:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 20, 2018 at 12:07 PM, Max Kellermann
<max+openembedded@blarg.de> wrote:
> On 2018/09/20 21:02, Patchwork <patchwork@patchwork.openembedded.org> wrote:
>> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>>   Suggested fix    Sign off the added patch file (meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch)
>>
>> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format]
>>   Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-connectivity/openssh/openssh/fix_without-openssl.patch
>>   Standard format  Upstream-Status: <Valid status>
>>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]
>
> Hmm, both is present in my (newest) patch.
>
>  https://patchwork.openembedded.org/patch/155025/
>
> Can somebody explain this Patchwork failure to me?

Try putting both tags at the start of a line rather than indenting.

