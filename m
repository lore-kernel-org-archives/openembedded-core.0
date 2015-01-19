Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3066572C35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 12:05:26 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Jan 2015 13:05:25 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 14E4F2800CB;
	Mon, 19 Jan 2015 13:05:25 +0100 (CET)
Date: Mon, 19 Jan 2015 13:05:25 +0100
From: "Maxin B. John" <maxin.john@enea.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20150119120524.GA9147@sestofb10.enea.se>
References: <1421420780-39453-1-git-send-email-maxin.john@enea.com>
	<CAJ86T=XNHXcGd+u1nZt1ZVE3m6SRnw5iqx-tGu+xKDDrCZ6TtA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XNHXcGd+u1nZt1ZVE3m6SRnw5iqx-tGu+xKDDrCZ6TtA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] curl: upgrade to 7.40
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Jan 2015 12:05:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Fri, Jan 16, 2015 at 12:00:16PM -0800, Andre McCurdy wrote:
> On Fri, Jan 16, 2015 at 7:06 AM, Maxin B. John <maxin.john@enea.com> wrote:
> > Upgraded version include fixes for these CVE bugs:
> > 1. CVE-2014-8150
> > 2. CVE-2014-8151
> >
> > Signed-off-by: Maxin B. John <maxin.john@enea.com>
> > ---
> >  meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-support/curl/{curl_7.38.0.bb => curl_7.40.0.bb} (93%)
> >
> > diff --git a/meta/recipes-support/curl/curl_7.38.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
> > similarity index 93%
> > rename from meta/recipes-support/curl/curl_7.38.0.bb
> > rename to meta/recipes-support/curl/curl_7.40.0.bb
> > index 85bd3be..209ed94 100644
> > --- a/meta/recipes-support/curl/curl_7.38.0.bb
> > +++ b/meta/recipes-support/curl/curl_7.40.0.bb
> > @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> >  #
> >  SRC_URI += " file://configure_ac.patch"
> >
> > -SRC_URI[md5sum] = "af6b3c299bd891f43cb5f76c4091b7b4"
> > -SRC_URI[sha256sum] = "035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba"
> > +SRC_URI[md5sum] = "8d30594212e65657a5c32030f0998fa9"
> > +SRC_URI[sha256sum] = "899109eb3900fa6b8a2f995df7f449964292776a04763e94fae640700f883fba"
> >
> >  inherit autotools pkgconfig binconfig multilib_header
> >
> 
> Perhaps also add a PACKAGECONFIG option for smb?

Thanks for pointing this out. I will send a patch soon.
 
> >From the curl 7.40.0 changes:
> 
> http_digest: Added support for Windows SSPI based authentication
> version info: Added Kerberos V5 to the supported features
> Makefile: Added VC targets for WinIDN
> config-win32: Introduce build targets for VS2012+
> SSL: Add PEM format support for public key pinning
> smtp: Added support for the conversion of Unix newlines during mail send
> smb: Added initial support for the SMB/CIFS protocol
> Added support for HTTP over unix domain sockets, via
> CURLOPT_UNIX_SOCKET_PATH and --unix-socket
> sasl: Added support for GSS-API based Kerberos V5 authentication

Best Regards,
Maxin 

