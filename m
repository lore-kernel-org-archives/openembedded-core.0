Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TQThV-0005gt-EI
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 03:54:37 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so42782lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 18:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=UFwBpy3vTztn8rImFB02CxGCuD1rFUybLXUNrl5dl8w=;
	b=fV/9dR66f+pL3fX2w7mbYLL79FLRghfbA2WOgl+tGAHspDFL43c54QKXzBNEG+w3tL
	pHuDqaRJ5Nz449gvXovAt/cNXnC2AlfIoQgWhx0EQ2zWRrshw6AVujf8w1WXtVe8DzN0
	te93F3sQNnrKR3lIiEsjBMj58b06yViekgMb+q8bH5f7tKBwMfQE6PNX6hAKtj+NILnt
	Re3ZjlYybRM08ZP3bO8k0jMVI+YjH4gIH98Sign1muLcuzZiVzPVBT9K6qMVshLeqftQ
	ZUE8H8WPz8+nNz1/UL1/b/2TzVjbenrdIPCCukT6iHgLb6wSss5FR8PjKxBcKQjJB6o0
	DSzA==
Received: by 10.112.29.9 with SMTP id f9mr4421983lbh.22.1350956471881; Mon, 22
	Oct 2012 18:41:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Mon, 22 Oct 2012 18:40:51 -0700 (PDT)
In-Reply-To: <1350919952-14859-1-git-send-email-giuseppe.condorelli@st.com>
References: <1350919952-14859-1-git-send-email-giuseppe.condorelli@st.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 22 Oct 2012 18:40:51 -0700
X-Google-Sender-Auth: N0Ebrdd1WI9P8N6CQ4xu7F9zj9M
Message-ID: <CABcZANmEHH_Z0V20K+ujWb3QkKXDLHK55JwTuCEQfXTcKTYa=A@mail.gmail.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: do_install_basefilesissue error
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
X-List-Received-Date: Tue, 23 Oct 2012 01:54:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 22, 2012 at 8:32 AM, Giuseppe CONDORELLI
<giuseppe.condorelli@st.com> wrote:
> Fixed error in do_install_basefilesissue, printf is now replaced by echo.
>
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>

What error? Also, this changes the behavior. printf doesn't print a
newline, echo does (unless you use echo -n). printf's behavior is much
more reliable and portable than echos is.
-- 
Christopher Larson


