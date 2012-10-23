Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TQT66-0005LK-J7
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 03:15:58 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so1897884lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 18:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fYzG9rJaG3NHGLz/20biJIE/d9pk8PHXuX6uXdOzP8A=;
	b=a84CDvm7KeOKZZshNTCBjeq5BkbXTu7bgxjMBlTLYguuR3zGNzvdMn2+kOvwrzRNXs
	sssbQkpT2SwUcLyoL1X5x2H08Oc8cI3+njpr9c3cKTUUOh+yQpWzSwYe5FPb9LSVTSbx
	/YTAVBa16a0lOupa11xu7u7+K3WYZBA+7SaZhCUNc1HFQfBbwKRRHPMgDl1AJxm69qE5
	tjVOr2jhtmEpx7xAFrnsnN1kJiPFinij3K0s3EnJpjL8Zlojj5jHBcdawHrsv30pP/wL
	ho0/ltNwnBqDfH+T4uRCw9R6g80z+5hOEWVODeranhzpKGwiPB0pUUx6WTy4utch6JEv
	u1uA==
Received: by 10.152.123.103 with SMTP id lz7mr9662768lab.21.1350954152893;
	Mon, 22 Oct 2012 18:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.1.49 with HTTP; Mon, 22 Oct 2012 18:02:12 -0700 (PDT)
In-Reply-To: <1350928144.1581.31.camel@empanada>
References: <1350919703-6105-1-git-send-email-kergoth@gmail.com>
	<1350928144.1581.31.camel@empanada>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 22 Oct 2012 18:02:12 -0700
Message-ID: <CABcZAN=oi=Pn68RWWsqAdCsoT-juM12SXeNnsTWx63gzPM2oQw@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][for-danny] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Tue, 23 Oct 2012 01:15:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 22, 2012 at 10:49 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> I guess the patch for lttng-modules should also remove the patch itself.
> I sent a patch to do that last week:
>
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030957.html
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-October/030958.html

Indeed, your patch for lttng-modules should be applied, and we'll
address the others through a separate commit.
-- 
Christopher Larson


