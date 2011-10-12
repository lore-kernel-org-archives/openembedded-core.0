Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RE08b-0002np-E4; Wed, 12 Oct 2011 16:50:30 +0200
Received: by ggnq1 with SMTP id q1so750430ggn.6
	for <multiple recipients>; Wed, 12 Oct 2011 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Viyp3eW8G7+VbdDDC1N6PrwmWOncqxTN+kvLDijUU9s=;
	b=QHSSbbd7uFNX/qKNMpOMMHYuXAM0a+Yg+64LLgI6qtEa5ZEmwTE1JMPdIhdxpYpWDp
	LA5UjGrSR1+DnRXUwF1VEfeIgvGR7K05HmLEknzyxolugxuHpQeNi3JxGg2XCRsDdtZM
	RIsFoa6E2pBkQW3XSCKr6X5zuJZH9Ab57UhvM=
MIME-Version: 1.0
Received: by 10.236.123.37 with SMTP id u25mr37752237yhh.50.1318430682647;
	Wed, 12 Oct 2011 07:44:42 -0700 (PDT)
Received: by 10.236.209.97 with HTTP; Wed, 12 Oct 2011 07:44:42 -0700 (PDT)
In-Reply-To: <1318361177.3726.1.camel@mattotaupa>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<1318361177.3726.1.camel@mattotaupa>
Date: Wed, 12 Oct 2011 10:44:42 -0400
Message-ID: <CAOd_LFy94B+0ApZYLu3Q3FxNtME9gH-eAnRrGKt=Aa=NR-QFBQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 14:50:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 11, 2011 at 3:26 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:

> is there more information about the reasons? Is it just a new machine?
> Where is it hosted now?

Certainly.  It is still hosted at OSUOSL.  We had some problems with
the original VM (Melo), so git has been running on a temporary VM
(Garnet, our build instance).  Now that we have a replacement for Melo
(Opal), we are moving to this machine.

> So what are the fingerprints of the new keys? ;-)

1024 ad:8e:65:4e:dc:4c:d9:63:8f:67:b3:87:03:c9:a1:73 ssh_host_dsa_key.pub (DSA)
2048 ed:99:0d:c1:6e:6c:02:75:df:36:25:4d:62:39:b7:e5 ssh_host_rsa_key.pub (RSA)

Let me know if you have any more questions.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


