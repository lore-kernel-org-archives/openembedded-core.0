Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id BD1376C23A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:52:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47bX6Y1kJpzKmhM
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:52:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1576432334; bh=nCpd3vc55mxe
	HyNWx7Blz+I46Hwu/J7lONUUgNjaWJ4=; b=JrskAYPPCeZmrBUekE089Do1CFtv
	4HRl6b4M8Amp2a1QE4eN2icNUV9ojh4M1U/Dgtwu5sj6PEQknbAW7eAhXMKl+KrB
	LsqvsInTsVJgLw+nsMRHMZimYLv83NXXesQ9TFukRppPzWorjpmjhJ4vE8uTQBXr
	WgEsNvxLNCxgmjZRf5xJMMEaKcC6k01WPOoEMfsV9olJNPrzALX1nCD1+BOBVXAs
	WgzyAn/hSrQ6k5n7kLqquA4qWN41l/+3Oc9e8+JhPBrCU1XLAu8M9f7YBV19r7UM
	tPB3TvmbpRcKeSly53XjUzbsgcEZJfiwsyKSRWb+Z0zIEacJCNeb4/fekQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576432339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=4cU8fdll98HPrQtikXJGSvxjIUQ0b2ABy6OLBH6EjX8=;
	b=PGxnPxzo4kIAdoIUvRs/sg185u1yj+ousjMCo28E5Tr7jrBsFgXjTGvbj6xZpw6SXK7j3s
	gXJgqXOrFDsxaIMLdlk130KvmEu/YJlHfss2r3q2PXRmU0Egcpnnyq+phItKD1f24aeUT9
	yxu3G6DnyqoXsQpzIfUreks0PkGnTpFviQI/Xk7OIpi94GJ8kUJRozsnoAgF1G43mav5qy
	vwoAfNxLQC5dbh9VXmOAVriCiCxom1VWtpJEbAUS9ahDsKmufMMcLkCLHwb5EMJRNbYIdh
	ykexBEi09LgLpZSYyv1J5Sxom0Pa4so/PKPyW+0o4emZ22vER8TFEf/rpvjx3A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id 5Qrt8OD4K-tA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:52:14 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-7-alex.kanavin@gmail.com>
	<CAMKF1spXie5SDtsJj6R=6hAUjYo8kBTmyj+SfW4rYU+1cWUtig@mail.gmail.com>
	<CANNYZj_k4NmmSAp+r80Ss+jgsd22hYcxRSySqYn7Yby8PCrDJw@mail.gmail.com>
	<CAMKF1sof2JwFMX=kHVaup_-LA3UjsqrU5iGXZymR5TOzGik1ZA@mail.gmail.com>
	<CANNYZj_ZaJ-prapQf6adS6Adp4CnF2X4TG3HPDonivPj_QAnrA@mail.gmail.com>
	<CAMKF1sp6a-hOuGazGtBj0mZQj9DpaM3iiC1Sbvw7Ah49vLLx9g@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <823eb2bc-4c55-1679-011d-53733df3b80f@mailbox.org>
Date: Sun, 15 Dec 2019 18:52:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp6a-hOuGazGtBj0mZQj9DpaM3iiC1Sbvw7Ah49vLLx9g@mail.gmail.com>
Subject: Re: [PATCH 07/30] gstreamer1.0-python: add a patch to fix python 3.8 builds
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
X-List-Received-Date: Sun, 15 Dec 2019 17:52:21 -0000
Content-Type: multipart/alternative;
	boundary="------------4ACC72A8842F6211B98635B2"
Content-Language: en-US

--------------4ACC72A8842F6211B98635B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Is this related to an issue I mentioned in my RFC?

 > gstreamer1.0-python_1.16.1.bb currently has a problem in that the 
gst-python code tries to load /usr/lib/libpython3.7m.so. But, in a 
regular installation, only /usr/lib/libpython3.7m.so.1.0 would be 
availale. It is possible to adjust the libpython path & name during the 
build. But - what would it be adjusted to? How would the recipe know 
that "/usr/lib/libpython3.7m.so.1.0" is the correct choice? Or perhaps 
would it make sense to add the /usr/lib/libpython3.7m.so symlink to the 
regular (as in: non-dev) Python package?


On 15.12.19 18:32, Khem Raj wrote:
>
>
> On Sun, Dec 15, 2019 at 9:12 AM Alexander Kanavin 
> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>
>     On Sun, 15 Dec 2019 at 18:06, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>
>         This is expected; the patch should be merged together with 3.8
>         upgrade.
>
>         I don’t think this patch is right though since this patch is
>         creating py3.8 dependency if you want to upstream something
>         that should work with all py3 I think
>
>
>     It's being discussed in the upstream submission ticket, and will
>     be resolved; we can take the 3.8-specific fix meanwhile.
>
>
> For better processing this series should be in three parts
>
> 1 Python 3.8 updates
> 2 gettext updates
> 3 rest of them
>
> I have filtered it into roughly these and currently staged in yoe/mut 
> just the third part which i think can be applied with out much problem
>
> For 1 and 2 there are breakages for many packages
> And it would be better to identify them and let community know of and 
> seek help
>
>
>     Alex
>
>

--------------4ACC72A8842F6211B98635B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Is this related to an issue I mentioned in my RFC?</p>
    <p>&gt; gstreamer1.0-python_1.16.1.bb currently has a problem in
      that the gst-python code tries to load /usr/lib/libpython3.7m.so.
      But, in a regular installation, only /usr/lib/libpython3.7m.so.1.0
      would be availale. It is possible to adjust the libpython path
      &amp; name during the build. But - what would it be adjusted to?
      How would the recipe know that "/usr/lib/libpython3.7m.so.1.0" is
      the correct choice? Or perhaps would it make sense to add the
      /usr/lib/libpython3.7m.so symlink to the regular (as in: non-dev)
      Python package?</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 15.12.19 18:32, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sp6a-hOuGazGtBj0mZQj9DpaM3iiC1Sbvw7Ah49vLLx9g@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sun, Dec 15, 2019 at 9:12
            AM Alexander Kanavin &lt;<a
              href="mailto:alex.kanavin@gmail.com"
              moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">On Sun, 15 Dec 2019 at 18:06, Khem Raj &lt;<a
                  href="mailto:raj.khem@gmail.com" target="_blank"
                  moz-do-not-send="true">raj.khem@gmail.com</a>&gt;
                wrote:<br>
              </div>
              <div class="gmail_quote">
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex">
                  <div dir="ltr">
                    <div>This is expected; the patch should be merged
                      together with 3.8 upgrade.</div>
                  </div>
                  <div>
                    <div class="gmail_quote">
                      <div dir="auto"><br>
                      </div>
                      <div dir="auto">I don’t think this patch is right
                        though since this patch is creating py3.8
                        dependency if you want to upstream something
                        that should work with all py3 I think <br>
                      </div>
                    </div>
                  </div>
                </blockquote>
                <div><br>
                </div>
                <div>It's being discussed in the upstream submission
                  ticket, and will be resolved; we can take the
                  3.8-specific fix meanwhile.</div>
              </div>
            </div>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">For better processing this series should be in
            three parts </div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">1 Python 3.8 updates</div>
          <div dir="auto">2 gettext updates</div>
          <div dir="auto">3 rest of them</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I have filtered it into roughly these and
            currently staged in yoe/mut just the third part which i
            think can be applied with out much problem</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">For 1 and 2 there are breakages for many
            packages</div>
          <div dir="auto">And it would be better to identify them and
            let community know of and seek help</div>
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div dir="ltr">
              <div class="gmail_quote">
                <div><br>
                </div>
                <div>Alex<br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
    </blockquote>
  </body>
</html>

--------------4ACC72A8842F6211B98635B2--
