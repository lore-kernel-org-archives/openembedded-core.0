Return-Path: <geissonator@gmail.com>
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41])
	by mail.openembedded.org (Postfix) with ESMTP id C41EC7965C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 13:13:48 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id e18-v6so5680433oti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sT0MgUJ90Z5XJECkA1Pb/sZYOWsHA7TRnXvytnfTi2Y=;
	b=Ju1usxhtdWBXv5CUdzRPHNxdTIdMor56FsolA6Xf2Xs+LQmcloYLL56HUrK8xt+TZy
	0Lg8Y74YHTNiOg9mwcSvx2i9HZ+KWNfabfalX7HiqTq1s3WZEJ0Qk1B6tJx507WXuX+U
	Igf45ge5kRd0NGM5Reise1yoPrWSXzhLU1fF2U8xlN663A/bxA0vrGe2ou3JRGftt8ri
	WNk+S4s/kRVMlzZpx2PvNGQLrOmzakmhRLHyfaGaNQpebx6vIOuw+LIULAF37qspFRhq
	26FuvGRPDXi2rjy8r56XYY45FbpilGiStVVJbEbEksyviS4B/wSMQH+9KKYwz4PMfriE
	PFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sT0MgUJ90Z5XJECkA1Pb/sZYOWsHA7TRnXvytnfTi2Y=;
	b=r1D+5dY1t+MfwtIDR6wU9IcaqMw4UiBB0CCWkkvTPKPufS1mjjc7QYVnl+U5POihQL
	kQxu8cBb1tgWgNAOyjf/jMJyd/+51zw+r3bv2VTQIJ30oGJXlaSWPkRfZzJUH2MyeDsi
	qD9nXF+qGi+PUzp5AGpm5oVooRwnB4XOW8tNBr0D10S8jq4fMnJ++h4d7wMptQpS+Pmm
	5ZGKz10lbB+0hoj27SMkfgpB2CXbOpmGS6utIwDhbmZX+q4SgGzjU8+yCM79ufC5tA2k
	HgaJD+nRuoFh7LBSNmO/e31DYkWCsjHBmGd+DGsM16p14SchC813jLprDElwftcsh3BY
	l9dA==
X-Gm-Message-State: APzg51CCyMEd6ZC9AfKaABJ377UyV1FcLt+gvND1LytqJbqUM+Cxt7nU
	NqKwWq+++Wt5DtR/QwFjbIutfBQhAS0RdHOEzJnuKg==
X-Google-Smtp-Source: ANB0VdZgWkafCuphf1o+5AQCATQapC0K6S4S4UD3MWC9HpOqz4U0ksT+EiOLD8UmxkvXIywSwyjy5jE7t47NncUvHzo=
X-Received: by 2002:a9d:1422:: with SMTP id
	h31-v6mr18676282oth.41.1537362829561; 
	Wed, 19 Sep 2018 06:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
	<1536960788-26056-2-git-send-email-geissonator@gmail.com>
	<CAJTo0La92vSVCfQyvgJga1gMrH=VskopHv9FnRHbiJ7yBA5-eQ@mail.gmail.com>
In-Reply-To: <CAJTo0La92vSVCfQyvgJga1gMrH=VskopHv9FnRHbiJ7yBA5-eQ@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 19 Sep 2018 08:13:38 -0500
Message-ID: <CALLMt=rvTYt6-CGponuyRGTQt2vPZdqxKrh4AwDvZ19aJdrvPw@mail.gmail.com>
To: ross.burton@intel.com
Cc: alejandro.enedino.hernandez-samaniego@xilinx.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] python: respect package order in manifest
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
X-List-Received-Date: Wed, 19 Sep 2018 13:13:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 19, 2018 at 6:08 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Close, but:
>
> ERROR: python-2.7.15-r1 do_package_qa: QA Issue: non -staticdev
> package contains static .a library: python-distutils path
> '/work/corei7-64-poky-linux/python/2.7.15-r1/packages-split/python-distutils/usr/lib/python2.7/config/libpython2.7.a'
> [staticdev]

Ahh shoot, I missed that reorder change in your patch set 1 changes.
I'll get an update up.

>
> Ross
> On Fri, 14 Sep 2018 at 22:33, Andrew Geissler <geissonator@gmail.com> wrote:
> >
> > Don't sort the manifest when using it to generate packaging rules, so
> > ordering can be used to have complex packaging rules.
> >
> > This is a backport of the same changes done by Ross Burton for python3
> >
> > Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> > ---
> >  meta/recipes-devtools/python/python_2.7.15.bb | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
> > index 43d9ff5..472c1da 100644
> > --- a/meta/recipes-devtools/python/python_2.7.15.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.15.bb
> > @@ -207,7 +207,7 @@ RPROVIDES_${PN} += "${PN}-modules"
> >  INCLUDE_PYCS ?= "1"
> >
> >  python(){
> > -    import json
> > +    import collections, json
> >
> >      filename = os.path.join(d.getVar('THISDIR'), 'python', 'python2-manifest.json')
> >      # This python changes the datastore based on the contents of a file, so mark
> > @@ -215,7 +215,7 @@ python(){
> >      bb.parse.mark_dependency(d, filename)
> >
> >      with open(filename) as manifest_file:
> > -        python_manifest=json.load(manifest_file)
> > +        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
> >
> >      include_pycs = d.getVar('INCLUDE_PYCS')
> >
> > @@ -248,8 +248,6 @@ python(){
> >              d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
> >          d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
> >
> > -    # We need to ensure staticdev packages match for files first so we sort in reverse
> > -    newpackages.sort(reverse=True)
> >      # Prepending so to avoid python-misc getting everything
> >      packages = newpackages + packages
> >      d.setVar('PACKAGES', ' '.join(packages))
> > --
> > 2.7.4
> >

