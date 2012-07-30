Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SvoUT-0008BL-Ee
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 13:50:25 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Jul 2012 04:38:48 -0700
Received: by ghbz12 with SMTP id z12so4102189ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 04:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=mQIWAjKK1yGvPgg5bHo3f4+tkoFTADdM+Lj1mJq8yww=;
	b=hPTvdfRKZtHTnRy3G+2WFUUtxUzKBRUKqh6b2Vb8FWV23M9HPuSgIiidcrlEBCsd2g
	IUc66Bm3JAVdYD+7s2VGe40Tql747g3ciTMqQB71SExCLX3SShJg0ae/evVR4/3rRqgv
	liz0a+L6kbgQlZmnhW7kPqb9nQ49AbiceEPww+JufaV6oLFkN/ZOcj8W3GaHpto7jmjc
	/oJeCoDM60WzD2l+BY+e2rBbSuwG7TYUldtAaFWZH1MgkdEGrGi8TJyKXCpbNx65brMi
	1EsQtG7zgmQvhrWhiETucoekaboCzudG71x+XefiLAi0oqqlIs2sMgtjoAO1VIVwsupP
	8MFw==
Received: by 10.50.179.74 with SMTP id de10mr7895458igc.61.1343648327397; Mon,
	30 Jul 2012 04:38:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 30 Jul 2012 04:38:27 -0700 (PDT)
In-Reply-To: <50167136.8040105@intel.com>
References: <50167136.8040105@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2012 12:38:27 +0100
Message-ID: <CAJTo0LZk0ObtxenvF6Qjo=wUXpmYfxV54LkWvZ+tA8Y_Kmo3Fg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmRNz2Fj9Q7SKP1o1XAfMwCkxbRypZ9VUrNECUPQ7uxIQMpABjNJbBDwHehK/wz/C/loBRe
Subject: Re: libunique upgrage
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
X-List-Received-Date: Mon, 30 Jul 2012 11:50:25 -0000
Content-Type: text/plain; charset=UTF-8

On 30 July 2012 12:34, Radu Moisan <radu.moisan@intel.com> wrote:
> For libunique I have
>
> No Upgrade Reason:Do not upgrade to version: 2.91.4 because it requires gtk+
>>= 2.90.0 and the stable version of gtk+ used by poky is 2.20.1
>
> Is this still true?

Yes, for the moment.  Long-term libunique should disappear, as GTK+
provides the same functionality.

Ross


