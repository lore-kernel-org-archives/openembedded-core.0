Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id D81426FE64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 09:52:13 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2C6632232CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:52:14 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A00742232066
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:52:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:52:12 +0200 (CEST)
Date: Tue, 2 Sep 2014 11:52:07 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140902095158.GB8525@mail.itconsulting-heinold.de>
References: <cover.1409650332.git.liezhi.yang@windriver.com>
	<5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 1/1] piglit: add bash to RDEPENDS_piglit
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
X-List-Received-Date: Tue, 02 Sep 2014 09:52:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2014 at 02:41:49AM -0700, Robert Yang wrote:
> Bash:
> piglit/usr/lib/piglit/tests/asmparsertest/make_test_list.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/asmparsertest/vp-tex.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-read.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/glsl-1.10/variable-index-write.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/arb_shader_texture_lod/compiler/make_tex_lod_tests.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct-const.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/glsl-1.20/execution/outerProduct.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/spec/glsl-1.20/compiler/built-in-functions/outerProduct-invalid-parameters.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_lod_tests.sh:#!/bin/bash
> piglit/usr/lib/piglit/tests/glslparsertest/glsl2/make_tex_rect_tests.sh:#!/bin/bash
> 
> The bash scripts are in the tests directory, we had planned to move the
> tests into the ptest pkg, but that would make piglit unusable without
> installing piglit-ptest.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-graphics/piglit/piglit_git.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
> index 5c013ef..f468120 100644
> --- a/meta/recipes-graphics/piglit/piglit_git.bb
> +++ b/meta/recipes-graphics/piglit/piglit_git.bb
> @@ -45,4 +45,7 @@ do_install() {
>  
>  FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
>  
> -RDEPENDS_${PN} = "python waffle python-json python-subprocess python-multiprocessing python-textutils python-netserver python-shell mesa-demos"
> +RDEPENDS_${PN} = "python waffle python-json python-subprocess \
> +	python-multiprocessing python-textutils python-netserver python-shell \
> +	mesa-demos bash \
> +	"
> -- 

Hi Robert,

how about to split out the tests into an extra package and let the package depends on bash?

Bye Henning

