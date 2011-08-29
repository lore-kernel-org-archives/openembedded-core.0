Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qy26E-0001s0-Se
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:42:02 +0200
Received: by eyb7 with SMTP id 7so3851164eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ZpewaB0V6AdQcmo7BBN6mGYf0ec40NOwIZa5tv7vqbs=;
	b=Mr/KPbDY4FTBT7Se01imcpiNFs7n531G2mjRFCOov8qero8mUyulWtS/k3TLnU52x5
	K4/A30vbJ5b+4E4QwrNFUrjKCklUsj4KkW8lZvZlD4Xstpr0pnXQeYOTzt7U4z3gjFtg
	4FKH8KQgiEIMFWclvetyvacz/J3CWVKT4nTb4=
MIME-Version: 1.0
Received: by 10.213.28.193 with SMTP id n1mr2624828ebc.42.1314625029784; Mon,
	29 Aug 2011 06:37:09 -0700 (PDT)
Received: by 10.213.16.202 with HTTP; Mon, 29 Aug 2011 06:37:09 -0700 (PDT)
In-Reply-To: <CAAQYJAtauhnv+RnUgjRzGay7AAB-FCC9qgRGj5k26dDVmYLaNA@mail.gmail.com>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAAQYJAtauhnv+RnUgjRzGay7AAB-FCC9qgRGj5k26dDVmYLaNA@mail.gmail.com>
Date: Mon, 29 Aug 2011 08:37:09 -0500
Message-ID: <CAD=GYpZ2bi+zVVGhxTUcwMcGzZro5FRiA8Z1Pvs69W3HOV0xXA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
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
X-List-Received-Date: Mon, 29 Aug 2011 13:42:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 8:32 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> I was exactly wondering about the necessity of such
> script...formatting an SD is not rocket science.
> If it is handy for =A0beagleboard then put it in its BSP.

So everything in oe-core is rocket science? ;) Just kidding

sure I'll move it over to meta-texasinstruments

thanks,
Joel


