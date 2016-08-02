Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id CF5AB6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:39:16 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id l9so17753686oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pmjpa1kp8XsXM9gOi/ylUn3fydkPtXSa49x91qmRXT4=;
	b=GY+ghUh5YPxPWs38TwqVF9l+owWbVi51ieg0nG5ctOQJyuvT+xed1wZphOlrQxe0Zu
	xXpWdQdbu+7GGki0jf4JvizOqqOtOOF7OhJprIZwT0KP8mnzgxvRnJqSYLA6D1W1EhXK
	mVUW1t9pznJ4vxICW4IMwprTCwVdELNSiHHmCpqgSV7gRVzNnu8f21BhY7fx6CWtDxxk
	IpPLPI3HHonz6wBsw6+BWy3XM09o6+bg1CFlZLySSMOIu68464ORlrZCB1/DAlKlu1G+
	lqbyX5bNodWvkycNp9o/2DasuRLq4quSl7ReUGPyWwAvZRAcZ+qnAGWA/uZdLq+ST/cY
	cL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pmjpa1kp8XsXM9gOi/ylUn3fydkPtXSa49x91qmRXT4=;
	b=RoJ50GTk6DfSEed2cUOGlK2qmTM4xXGhxh4f3jKqZ0iGuQ1ybDTLEk+TJqlwjEh3HP
	NskVkLCjL2hSJ6D0XLtmzIF2Ho1m/IgtVwuCJi+XPp1t/+kD0Y8NwSfIHvlP2ks4eV9j
	PRIVf4ckWZbdcTcxTtQtg+1pgwhUAwab8/uB+I7QzI47ZL+OhqdvAksQGTIwLCRa02Xn
	9xj72UZ9C9BBVGNL19tXuwi2/7qNT68BkKRtKwS7hw5xFdy2gHn65ovrPicbXR/O3grC
	neK7sVAdc2mK3fi0crY/UM2vZOjTbag4r/835XJ177R5+dV8NcsuFD96Aldk1dIFGNa1
	W0uw==
X-Gm-Message-State: AEkoouuk7SGIqZU/oTljrXx5VfMMRFwzqRIH6Tm60zB++D5Iw+t03Oaoqf2pFFVmJRXyMknoO8hBNNtZ+QKBxw==
X-Received: by 10.157.22.153 with SMTP id c25mr42194126ote.111.1470166757522; 
	Tue, 02 Aug 2016 12:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Tue, 2 Aug 2016 12:39:16 -0700 (PDT)
In-Reply-To: <CAJTo0LaE7EXZCLCrbmUPKrDK2xrmnKDgpLoM+9itbb6Cw7GW9w@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
	<CAJTo0LaE7EXZCLCrbmUPKrDK2xrmnKDgpLoM+9itbb6Cw7GW9w@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Tue, 2 Aug 2016 12:39:16 -0700
Message-ID: <CAOLEWZVASN=fVzQMq+HJmMgUujvRtQkoq0gnrUJEOkfoQyGJMw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Tue, 02 Aug 2016 19:39:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 2, 2016 at 12:23 PM, Burton, Ross <ross.burton@intel.com> wrote:
[snip]
> In a desperate attempt to keep the ball rolling I propose this repo as a
> starting point:
>
> https://github.com/rossburton/meta-printing
>
> It's basically a new layer containing foomatic, ghostscript and cups from
> oe-core.  Obviously this shouldn't be the final resting place, but its
> somewhere where we can start before deciding where it should reside.  If
> anyone wants commit access then just say.
>
> Ross

Okay, please add me...

Steve

