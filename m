Received: from mail-lb0-f182.google.com ([209.85.217.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UPa3c-0006H9-0l
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:02:37 +0200
Received: by mail-lb0-f182.google.com with SMTP id z13so6961629lbh.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=67XqdidV9zFs+NytyZfX90EDqxgKMwiCgiQCRae6JlY=;
	b=ARhUjpCSpMxJEG7Og3wVm7i2UKDlGJBpJ77uSLLGqr6Cu7d9OchQFbQdlrXlnUcKPP
	mZD9o3CS5Cm4+wsvlbvUavwO5s5wGRgtb90Q1ER2b56DzSH1Ol4WyhdfQdVvXZuYQ70d
	+lOflHe+n4xGTk9I/jbVUgRegzXdfhyHhfnO4kQYP6Y7XguKg+YvLSaO7XeEuSNXl9OO
	xHwdw5JB9QDXF/0fCMZk75zV1FO3gax/j77+jReE7TXcXZtrAgv9H/lilQvvyamQm52k
	k2YeFXIkChLTz6trcsxKj/XsL07vjWgEwE3JhopFffLZG3m50qzT1EpqR8QzcVFxg5/I
	ksKA==
X-Received: by 10.112.136.33 with SMTP id px1mr13986572lbb.95.1365518679481;
	Tue, 09 Apr 2013 07:44:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Tue, 9 Apr 2013 07:44:18 -0700 (PDT)
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC755FF49C469@xmail3.se.axis.com>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
	<CABcZANk=ttfyLhq-z8Fnj1_mjv5hhPAmauvKXjfWzG-q-B4cxA@mail.gmail.com>
	<A612847CFE53224C91B23E3A5B48BAC755FF49C469@xmail3.se.axis.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 9 Apr 2013 07:44:18 -0700
X-Google-Sender-Auth: 6Gf7SDEU4wC-KbjIzJ1ZOd5AWow
Message-ID: <CABcZANnjqp2HQ8ixyHDCsq4uQnTUVHpZ8Yn-dFf7bafqJWAYtA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Tue, 09 Apr 2013 15:02:42 -0000
Content-Type: multipart/alternative; boundary=089e0115fc4ed324ab04d9ee97b5

--089e0115fc4ed324ab04d9ee97b5
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 9, 2013 at 3:01 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> The colon separator is included at the end of $NEWPATHS so it should not
> be possible for any false positives.


Ah, right, thanks for the clarification :)
-- 
Christopher Larson

--089e0115fc4ed324ab04d9ee97b5
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Apr 9, 2013 at 3:01 AM, Peter Kjellerstedt <span dir="ltr">&lt;<a href="mailto:peter.kjellerstedt@axis.com" target="_blank">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The colon separator is included at the end of $NEWPATHS so it should not be possible for any false positives.</blockquote>

</div><br>Ah, right, thanks for the clarification :)<br>-- <br>Christopher Larson</div></div>

--089e0115fc4ed324ab04d9ee97b5--
