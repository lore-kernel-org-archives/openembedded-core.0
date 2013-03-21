Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UIieD-0007sZ-4k
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:47:27 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so2060002vbn.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2013 09:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pWZG6oENWE9imipU0Vc7crLjB7j1luFuIugDhi45MIc=;
	b=XVxPWcv8+1ic7uSaAq4OnZdiaTOu4ebOz3XBSWnBFz3WVoT6QT4D+TZ5a7YAGuY2CB
	I1WGbbB+MnbtxkJH2mqsn6Ul+rfBQ7ei9TA6P33oYemdKO76kNOFe3raB6cDTkGRF4KL
	NkUGlUZnnfDDffxEajOS5YZGPZJ+yg3JQl7xEkqNPWk0zbpSl7ho31lSmC79CiFaezfx
	Qxs+QAFSHfHjd1wCDlzSbPw5mux6OTcmNlOnNgtxat5RFhg21LJfl2EkBeJumjkzVGXY
	T0/OyFvHj96WsbhBNk2z1ci1vHYJFJBlWWTejyNvtte8yV4a1adkOLImKFOzph63yQUS
	kI1Q==
X-Received: by 10.59.11.67 with SMTP id eg3mr14397457ved.31.1363883432221;
	Thu, 21 Mar 2013 09:30:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Thu, 21 Mar 2013 09:30:12 -0700 (PDT)
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Mar 2013 16:30:12 +0000
Message-ID: <CAJTo0Lbo8zRjtsX1xYBgz6b00k2Up0wXscA5b2uycDHXF09PKQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnhJPHwK150iNOSzF/yi8NjSZAJhxfiv1LdWxG477P8jHzChIKUCg2A2yI8vClBFUirghTr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/16] libuser: Fix case where ${B} != ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 16:47:28 -0000
Content-Type: text/plain; charset=UTF-8

On 21 March 2013 15:55, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Fix out of tree builds and a parallel make race, see the patch header
> for details.

As there's no cover letter, I'll reply to this.  From a reading of the
patches (no build testing) it looks good, so Acked-by: Ross Burton
<ross.burton@intel.com>.

Ross


