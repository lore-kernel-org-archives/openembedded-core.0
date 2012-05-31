Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SaCSn-0000zz-6I
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 22:59:21 +0200
Received: by yenl13 with SMTP id l13so1254973yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kuYsIrb9Y00zD891vz+bbYFjfZGd+bgv+3McDxYvB64=;
	b=KK7SyfzNYWFiPNBhQ48tZu3DkKqkHCO7IKqNd0i9q3imwhyRwR6ZOZ+OvKWd3GtKtN
	Gl0OjOoYvabgV3f4F4/ptkKup3t7jFYJUVZ1hmx8Zs+PaISxPt2myyyVY5iHU1/P+9o/
	a270leUVj2+zQn7dHOrX9RXJ1ZdBVleg0DrYVhoahe07XKZ3TXVdgDjsoFQFIXgJqJIL
	Bfc1s0bFKYZqnDWmtMBYN3JQ//fVvl0w5UmSqaSk494T0k3GLeeKrcskSDC77vb5g29M
	63ny7BAPsJsppZ1ER6jQqw2gTEJpFjq/Wuui8EoR6cCbIggTVuZv6EugSEK9OJypl2Fa
	fa7g==
MIME-Version: 1.0
Received: by 10.50.222.170 with SMTP id qn10mr77495igc.45.1338497340219; Thu,
	31 May 2012 13:49:00 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Thu, 31 May 2012 13:49:00 -0700 (PDT)
In-Reply-To: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
References: <33616B9B-AAC8-474C-8790-047AA44C1C89@gmail.com>
Date: Thu, 31 May 2012 15:49:00 -0500
Message-ID: <CAAB-1yw=5xF=YGY+VgU-RvCHYNJ2zYWvZBTwVR+2L3L0UUqG1A@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-xilinx] Generating device tree for building linux-xilinx kernel
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
X-List-Received-Date: Thu, 31 May 2012 20:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

That's a second process that you need todo with xilinx EDK to export
and launch xilinx SDK
from there create a new device tree project which will parse the "mhs"
hardware descriptor file
and from there generate the device tree according to the hwd settings...

The only docs available to get to know how the SW/HW works are part of
my thesis which can
be found here: http://aalonso.wordpress.com/2011/11/08/thesis-documents/

Regards
Adrian Alonso

On Thu, May 31, 2012 at 3:28 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> Hi Adrian,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 When I attempt to build the linux-xil=
inx kernel, it doesn't find the device tree (*.dts) in the xilinx-ml507-upd=
ate BSP project. Is the device tree supposed to be generated manually? If s=
o, could you please tell me how to generate it?
>
> Best regards,
>
> Elvis Dowson



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


