Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Su0cj-0007Ei-4w
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 14:23:29 +0200
Received: by vbbfr13 with SMTP id fr13so453093vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 05:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=52kzxvFnOaptZIhvZ1LorY+j0W575zsjH9S4Fx8oh5M=;
	b=OrXtqD7QmBKYbFyWzmcSMNX08XCbawr+7EUlZFCG0/tzoJzkCLtjG+T75ChI4PDGjj
	7SxXO6OBkWVYyD7mk7aiotaOO4ifi2iLbI1aCYSmsUfoyNDhsU4yovqscTxGtCXkiczR
	Q3nTSKBA1SdabAV8zusEyytZpCneiMoJJfTZuxFtlBoSo4V/XxrIV6jK5wo4S6ghTq2N
	2zrbzPvCGX/7R62fmTNcU/7C6XmfL8hczOQBvy9oMSXXUNmvxJnqXxRQokvca7qAEe7A
	hnUQOvI6tykYtBaE0mJbwr+p0Rgc+TIewNWS3sWGvnJogvD25ae3FLaud3NUrAOdZOnN
	urBQ==
MIME-Version: 1.0
Received: by 10.220.154.79 with SMTP id n15mr17964547vcw.61.1343218319004;
	Wed, 25 Jul 2012 05:11:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Wed, 25 Jul 2012 05:11:58 -0700 (PDT)
In-Reply-To: <1343206296.22222.24.camel@ted>
References: <1342804329-5791-1-git-send-email-otavio@ossystems.com.br>
	<1343206296.22222.24.camel@ted>
Date: Wed, 25 Jul 2012 09:11:58 -0300
X-Google-Sender-Auth: S1CkUjvpjBAgLT56hPdyKpeHwoQ
Message-ID: <CAP9ODKpaH_RNunGH+zvmp5TFS0PnBA59__pdaoLywy8nMdq+Zw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bash: enable parallel build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 12:23:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 25, 2012 at 5:51 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-07-20 at 14:12 -0300, Otavio Salvador wrote:
>> I've build it several times in a 8 core machine without problem so it
>> seems safe to use parallel build now.
>
> Sadly its not:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/174/steps/shell_23/logs/stdio

Good that it has been catch but I am pondering why this worked fine here...

Please drop this patch then ... if it has been applied, I can send a
reversing patch if you want.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


