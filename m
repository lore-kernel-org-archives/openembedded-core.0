Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJmTv-0001o3-ID
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 14:56:08 +0200
Received: by wye20 with SMTP id 20so5204139wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=isAUJBbBOefrQWVm987001INubMa/XQrgLnXZ3IAOjQ=;
	b=foAVCG0YyVhOHYZdCs4EUJZFO9IqFIIUBcgtowZJ5TNSwPi5PK4HOBGNfnvpeONgrL
	Ap/bDHO8ANOrbtGCmEAAbcxoIzCCMeG1Ac1P5tzLS7w6e7O3hz/gR2tZoUAQj6M8OGEb
	0FuadWvql1pXw5e7ulGnShAajxNH9VpVVuKmw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=nBGz15Uj1LYrls/fQ2o93eGPBoIRSLhR616AU6L+NRJE5tGkBT6U7UM0JDGKX6E6QZ
	fEA3nBHZWOyIbamSR3NYi44KrFQxMmIedl+5LvXHuDPNIUC5ZrtGGvipZg9v9ww/5Bgw
	FMUFXf0DY27iqNZOcWuS3WRfY+atJeuJqk5LQ=
MIME-Version: 1.0
Received: by 10.216.221.22 with SMTP id q22mr1593465wep.37.1305031999179; Tue,
	10 May 2011 05:53:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 05:53:19 -0700 (PDT)
In-Reply-To: <4DC8CA7E.4020302@linux.intel.com>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
Date: Tue, 10 May 2011 09:53:19 -0300
X-Google-Sender-Auth: Y7fhlZ8YX-TvKA8wWdKzK-WIfbE
Message-ID: <BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 12:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 02:17, Saul Wold <sgw@linux.intel.com> wrote:
> Next time, please use the create-pull-request script, which will generate=
 a
> set of patch emails so that we can review this information via email. I w=
ill
> make a couple of additional comments below associated with each patch.

It has a problem to me since it depends on using the contrib repo and
I am using github.
...
>> =A0 =A0 =A0 insane.bbclass: skip license checksum if LICENSE is "CLOSED"
>
> I assume you are adding this for layers and commercial work, we should ne=
ver
> have CLOSED in any open layer.

Sure. I fully agree but I also think it is insane to have to provide a
fake license file to workaround it in every repository I am using
internally.

>> =A0 =A0 =A0 cmake: add support for oe qt4 tools names
>
> Please add a comment to the patch explaining it's purpose and origin, and
> include a Signed-off-by: if appropriate. Any patches that you have modifi=
ed
> or added should include the above info.

On the patch itself? Any doc describing an example of it?

I am waiting for Richard and Koen replies about my questions and will
provide updated patches for the unmerged ones.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


