Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdkfN-0006OK-S0
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:39:18 +0100
Received: by mail-gg0-f175.google.com with SMTP id y1so1537266ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0ovWyYKnr/M+tB8sK/inu4OH/gcvcLgaQD7Dmjc7cag=;
	b=In1QOFAWhQr2aE3SxZO4NNHz3DQz+XHO236oaUGNjuM45lkfqcFt9CR96hVorKt4Nu
	Lm58JJ26qcyDlE/FWjMcm/i5lsyI3OwxQeiz2hrsHXkldEX/Ot/pq1RMbCZB6jn5Szg8
	I49Sl5AUP1zV1ARf8lGdCk7OWu3nF38zdYfCAi9ARaxua2TZq7Uy6zy7RNnUyKFkuzlc
	RkewB7ttSKqJbMSMfwHfTqaKFwler70wOBAS+y1B4Ps/YWVbklw2GOYFmbdc9T5lrH2F
	t+PvUeTjzPlpe8F8yviSwKv+NtnQFD8arMavPSM/cV/ZwQNxjd5Zr7tLKdGve+MDbO20
	Tpbw==
MIME-Version: 1.0
Received: by 10.58.240.107 with SMTP id vz11mr29814003vec.45.1354119902344;
	Wed, 28 Nov 2012 08:25:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.116.17 with HTTP; Wed, 28 Nov 2012 08:25:02 -0800 (PST)
In-Reply-To: <CAJTo0LbDv-c2cyAfvWzfo7wiH2_F9+pCx-CC4QFyzM_e1havEw@mail.gmail.com>
References: <1354116528-21598-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKo4+FnG=c1m88HeG-MxbzQD-+MyLo85G47Qh_uNcxKJEw@mail.gmail.com>
	<CAJTo0LZXgDtv_EsxnCvLv5nyHpf5FBtFYRYtXyCj+7D=uKpWDA@mail.gmail.com>
	<CAP9ODKqBNJ7QpJq7M_-0=G=rq3EZiCeBeWpBHGiGju53o9a2ZA@mail.gmail.com>
	<CAJTo0LbDv-c2cyAfvWzfo7wiH2_F9+pCx-CC4QFyzM_e1havEw@mail.gmail.com>
Date: Wed, 28 Nov 2012 14:25:02 -0200
X-Google-Sender-Auth: bSBqyFutrOLe9r5c2LZzkdDDO6k
Message-ID: <CAP9ODKqEL9D-YTs4npXKWyiLhhHVdKoz=mdc0G9afOFqWnPcPA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: restore packaging for the DRI/DRI2/DBE extensions
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
X-List-Received-Date: Wed, 28 Nov 2012 16:39:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 2:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 28 November 2012 16:02, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Well but in this case we would be better to have 1.9 in oe-core, in this case.
>
> meta-intel alone contains 1.9.3 (for EMGD) and 1.7.99.2 (for emenlow).
>  I don't think it's reasonable to collect every xserver version that
> binary drivers have built against into oe-core, nor is it reasonable
> to force them to do all of the packaging themselves (at least whilst
> the fix to make the same inc build for old and new is to add a few
> package definitions).

Yes I understand; well as I said I understand your point and why you
wish to do that.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


