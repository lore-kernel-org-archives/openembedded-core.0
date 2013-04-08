Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPGBp-0000Qq-AZ
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 19:49:10 +0200
Received: by mail-wi0-f169.google.com with SMTP id c10so4111639wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 10:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Fr1MKktkdmoDKYppjafF7cVUerq5qw6sY1tu9UWQhy4=;
	b=Q5yCkDkrnYrApsXKBb3m31BAvagJolI5KaXY79urkkzSvuqaaJ66Cd1/7o/U2t76Ra
	cwpsjR2rVVaUfkD6GZ0pGoNNs8mYhY7vYyYVt29BWb0yiazUr30P/V60Z2WbCBTwYvya
	eMJJulAmIvlmAna4cdlbQ7SUtXx/9tl1clCaJ+aXY0++c4qLnw125erMMPxxACOHOYnn
	dMgCjewcUxkW/hAVNkpGCN9eG8ka4/obh6iYkmIMIXZMuuereugrTZ4xD/hVVzhEuWU3
	1KMvkctjjTIFjxZY7XKGJx4WWZlgbRiBFhqKjXxil0NAo92Fu6GrpaAwgJJfAQVjWO8r
	9e1Q==
MIME-Version: 1.0
X-Received: by 10.180.182.36 with SMTP id eb4mr14451804wic.8.1365442310457;
	Mon, 08 Apr 2013 10:31:50 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Mon, 8 Apr 2013 10:31:50 -0700 (PDT)
In-Reply-To: <a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
Date: Mon, 8 Apr 2013 13:31:50 -0400
Message-ID: <CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 08 Apr 2013 17:49:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 12:59 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> +[ "${PATH#$NEWPATHS}" != "$PATH" ] || PATH="$NEWPATHS$PATH"

This is certainly a welcome addition in functionality, but it relies
on the pattern remaining at the start of the PATH (i.e. the user
hasn't played with PATH in any way). Could we not use the
${parameter/pattern/string} parameter expansion instead (e.g.
"${PATH/$NEWPATHS/}") so it doesn't matter whether the user has
further modified the PATH?

Best regards,
    Trevor


