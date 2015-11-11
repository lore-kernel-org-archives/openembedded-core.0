Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id D194175EE7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:32:42 +0000 (UTC)
Received: by pasz6 with SMTP id z6so14988464pas.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 17:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=A0rVkVTC/4X7Ls915UJ40OWMcgxiKvSo6YBxOA4kTtE=;
	b=AvVIg59bh+B3ahVI3R0KFMl7Y44xB3scG6KEBmdeqInC628r149of8WLmTWOLSwSoQ
	kHnrSoVwSr17pRIz4qrsnqCQZo+/U/ocPLcw4ZFP0PV/7SqS6EdOD9og8cP+TCswvdfG
	87glIfbX9HRsmIe+zrYt5s6rKGEQeC8pC04CSFSytOjOfn1vcMKaRmA6EBze94A/I8Pb
	yqcoKAcO+Y8I+Zk6Qen0oHxvKwP299TrNa+lj28X7J4zWp8AmKilhJ13d/2oWico8uQ/
	fXlYuqZuAk8cGz02KcMnPBhLEO9yhqgqAUOImDjcmhMwN1/qRk0SN1+j4xd431dykAWe
	0zDg==
X-Received: by 10.66.188.49 with SMTP id fx17mr10319104pac.95.1447205562381;
	Tue, 10 Nov 2015 17:32:42 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	ck9sm6482221pad.28.2015.11.10.17.32.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Nov 2015 17:32:41 -0800 (PST)
To: Tudor Florea <Tudor.Florea@enea.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1435890305-23163-1-git-send-email-tudor.florea@enea.com>
	<26724FB0BFCB3D4C91BDE184751AA3A428CB1D4B@SESTOEX04.enea.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56429AB8.2020800@gmail.com>
Date: Tue, 10 Nov 2015 17:32:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <26724FB0BFCB3D4C91BDE184751AA3A428CB1D4B@SESTOEX04.enea.se>
Subject: Re: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream
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
X-List-Received-Date: Wed, 11 Nov 2015 01:32:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/10/2015 04:57 PM, Tudor Florea wrote:
> There was not feedback on this.
> Under the same CVE there lay actually many python vulnerabilities that are still applicable for dizzy branch.
> Among those only poplib module is covered (python-2.7.3-CVE-2013-1752-poplib-fix.patch)
> This patch covers httplib modules and I have also a patch for the remaining modules.
> Should I (re)send the patch?

yes.

regards,
Armin

> Regards
>   Tudor.
> 
> 
> -----Original Message-----
> From: Tudor Florea [mailto:tudor.florea@enea.com] 
> Sent: Friday, July 03, 2015 5:25 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Tudor Florea <Tudor.Florea@enea.com>
> Subject: [dizzy] [PATCH] python: Backport CVE-2013-1752 fix from upstream
> 
> This back ported patch fixes CVE-2013-1752 for httplib
> References:
> http://bugs.python.org/issue16037
> https://access.redhat.com/security/cve/CVE-2013-1752
> 
> The httplib module / package can read arbitrary amounts of data from its socket when it's parsing the HTTP header. This may lead to issues when a user connects to a broken HTTP server or something that isn't a HTTP at all
> 
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  .../python-2.7.3-CVE-2013-1752-httplib-fix.patch   | 45 ++++++++++++++++++++++
>  meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch
> 
> diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-httplib-fix.patch
> new file mode 100644
> index 0000000..e68f53f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-htt
> +++ plib-fix.patch
> @@ -0,0 +1,45 @@
> +Upstream-Status: Backport
> +
> +CVE-2013-1752: httplib: HTTPMessage.readheaders() raises an 
> +HTTPException when more than 100 headers are read.
> +Patch by Jyrki Pulliainen and Daniel Eriksson.
> +
> +Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> +---
> +diff -r 133ee2b48e52 Lib/httplib.py
> +--- a/Lib/httplib.py	Fri Aug 01 23:51:51 2014 -0700
> ++++ b/Lib/httplib.py	Sat Aug 02 13:59:25 2014 +0000
> +@@ -214,6 +214,7 @@
> + 
> + # maximal line length when calling readline().
> + _MAXLINE = 65536
> ++_MAXHEADERS = 100
> + 
> + class HTTPMessage(mimetools.Message):
> + 
> +@@ -271,6 +272,8 @@
> +         elif self.seekable:
> +             tell = self.fp.tell
> +         while True:
> ++            if len(hlist) > _MAXHEADERS:
> ++                raise HTTPException("got more than %d headers" % 
> ++ _MAXHEADERS)
> +             if tell:
> +                 try:
> +                     startofline = tell() diff -r 133ee2b48e52 
> +Lib/test/test_httplib.py
> +--- a/Lib/test/test_httplib.py	Fri Aug 01 23:51:51 2014 -0700
> ++++ b/Lib/test/test_httplib.py	Sat Aug 02 13:59:25 2014 +0000
> +@@ -262,6 +262,13 @@
> +         if resp.read() != "":
> +             self.fail("Did not expect response from HEAD request")
> + 
> ++    def test_too_many_headers(self):
> ++        headers = '\r\n'.join('Header%d: foo' % i for i in xrange(200)) + '\r\n'
> ++        text = ('HTTP/1.1 200 OK\r\n' + headers)
> ++        s = FakeSocket(text)
> ++        r = httplib.HTTPResponse(s)
> ++        self.assertRaises(httplib.HTTPException, r.begin)
> ++
> +     def test_send_file(self):
> +         expected = 'GET /foo HTTP/1.1\r\nHost: example.com\r\n' \
> +                    'Accept-Encoding: identity\r\nContent-Length:'
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
> index cbe8d7f..d603587 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -40,6 +40,7 @@ SRC_URI += "\
>    file://posix_close.patch \
>    file://python-2.7.3-CVE-2014-7185.patch \
>    file://python2.7.3-nossl3.patch \
> +  file://python-2.7.3-CVE-2013-1752-httplib-fix.patch \
>  "
>  
>  S = "${WORKDIR}/Python-${PV}"
> --
> 1.9.1
> 

