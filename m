Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f46.google.com (mail-yw1-f46.google.com
	[209.85.161.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0607778CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 11:56:44 +0000 (UTC)
Received: by mail-yw1-f46.google.com with SMTP id z143-v6so1299095ywa.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 04:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=llxI9PjJgJInG7lm4YpGZBeImmB+nAMP+3cHsQ/IEqg=;
	b=O/mVNsleY+8Lg2leABn7TJ/6h5G2+0CSpIayRCFjNlZAGJZ1RfhSmgtw25kD3Lf3rk
	Gl3lcj68Zm8Ee1AUw94QNtRa5oVvTERMU3StdPks9hREuEuXghsLIWCidHxK/9XxWzV6
	QJPpMgernvBkGn2RxlyMkIGogkyLxxvELqB9M4tC0JQMpaSY3TlaLRrKJ+0diRi93Bn2
	n///WMwpA9r0syQrCAfjJmdnEuvBwj8b76C6K16cnc0jxV9UEz3TPsXvKwBWeqOoq2eq
	nlXQxgGOP2OZTbf4b4OCimpeGahLYNy9WAKKbim/JzYfjvldihJje633MSdhAXn3ggQg
	U9OA==
X-Gm-Message-State: AOUpUlE3Wg2yo6PJGqimN0BadJIueei2ggWrycZzEa9lMFkAS9aCNHGd
	sbWn8OeKjvLeTW21a9ZAEmhrmXyg
X-Google-Smtp-Source: AA+uWPy7XE55ZLAaaD4PjZ1YUBOh3k8GdJfs8ZYlJrtT7ZsfncHM9Fo3i4udFrejrbC7zC8dhAQyaQ==
X-Received: by 2002:a81:3609:: with SMTP id
	d9-v6mr1153501ywa.191.1533729405775; 
	Wed, 08 Aug 2018 04:56:45 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h63-v6sm1551076ywb.28.2018.08.08.04.56.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Aug 2018 04:56:45 -0700 (PDT)
Message-ID: <553fbe81eb89fc20b3f4c1506b7826d6b28756dc.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 08 Aug 2018 12:56:42 +0100
In-Reply-To: <1526464678.32156.14.camel@andred.net>
References: <20180309130000.1937-1-git@andred.net>
	<20180321163130.23765-1-git@andred.net>
	<1525939504.5115.18.camel@andred.net>
	<1526464678.32156.14.camel@andred.net>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] rootfs-postcommands: put image testdata under sstate control
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
X-List-Received-Date: Wed, 08 Aug 2018 11:56:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

ping

On Wed, 2018-05-16 at 10:57 +0100, André Draszik wrote:
> Is there anything wrong with this?
> 
> On Thu, 2018-05-10 at 09:05 +0100, André Draszik wrote:
> > ping
> > 
> > On Wed, 2018-03-21 at 16:31 +0000, André Draszik wrote:
> > > From: André Draszik <andre.draszik@jci.com>
> > > 
> > > The testdata.json is being written to DEPLOY_DIR_IMAGE directly,
> > > thus bypassing sstate, which results in an ever growing list
> > > of files.
> > > 
> > > Write them to IMGDEPLOYDIR instead, so as to benefit from the
> > > automatic management via sstate.
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > > 
> > > ---
> > > v2: fix typo in subject line
> > > ---
> > >  meta/classes/rootfs-postcommands.bbclass | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/meta/classes/rootfs-postcommands.bbclass
> > > b/meta/classes/rootfs-postcommands.bbclass
> > > index a4e627fef8..01eee350b8 100644
> > > --- a/meta/classes/rootfs-postcommands.bbclass
> > > +++ b/meta/classes/rootfs-postcommands.bbclass
> > > @@ -303,17 +303,18 @@ rootfs_sysroot_relativelinks () {
> > >  python write_image_test_data() {
> > >      from oe.data import export2json
> > >  
> > > -    testdata = "%s/%s.testdata.json" % (d.getVar('DEPLOY_DIR_IMAGE'),
> > > d.getVar('IMAGE_NAME'))
> > > -    testdata_link = "%s/%s.testdata.json" %
> > > (d.getVar('DEPLOY_DIR_IMAGE'), d.getVar('IMAGE_LINK_NAME'))
> > > +    deploy_dir = d.getVar('IMGDEPLOYDIR')
> > > +    link_name = d.getVar('IMAGE_LINK_NAME')
> > > +    testdata_name = os.path.join(deploy_dir, "%s.testdata.json" %
> > > d.getVar('IMAGE_NAME'))
> > >  
> > > -    bb.utils.mkdirhier(os.path.dirname(testdata))
> > >      searchString = "%s/"%(d.getVar("TOPDIR")).replace("//","/")
> > > -    export2json(d,
> > > testdata,searchString=searchString,replaceString="")
> > > +    export2json(d, testdata_name, searchString=searchString,
> > > replaceString="")
> > >  
> > > -    if testdata_link != testdata:
> > > +    if os.path.exists(testdata_name):
> > > +        testdata_link = os.path.join(deploy_dir, "%s.testdata.json" %
> > > link_name)
> > >          if os.path.lexists(testdata_link):
> > > -           os.remove(testdata_link)
> > > -        os.symlink(os.path.basename(testdata), testdata_link)
> > > +            os.remove(testdata_link)
> > > +        os.symlink(os.path.basename(testdata_name), testdata_link)
> > >  }
> > >  write_image_test_data[vardepsexclude] += "TOPDIR"
> > >  

