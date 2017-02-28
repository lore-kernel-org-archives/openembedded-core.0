Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 62B8D600E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 18:19:25 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id y135so15012536itc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 10:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=fsYwA+EKLJYc+x3o9KfVwg8hU4fs0FcCRxiCbhnWf0Q=;
	b=JxxTZsv3mgHJQyCIEhkXw1pLKmDpwSSbs2Odv1HZNmEWKpdqF9BsJkMkhnWWJp8pYx
	tpGIvS8wWsk1YJZ0hrcq5URPRlPa7X/nWoCxB+uomL6Y2YihmEMDr8wqOh8oeX3/nWbS
	T5eiGsk2yK1uN/HbIj14mYYe/1sF68ULl6tSeKXaFnFypppkpPFxH+SxaKNSRtdsMzZE
	oLdripuy8BRhRkI1EtmRPQ6pHic9oEVjLljk0IibfGCkOIXXI/CQ/1HCjZE16tpAdh2z
	H81xO9jdGFWiKNdH/fsMJ49Vh/QHWrwmmiFiKlZpbjU9YIbE8R+wLjpZUbl0RgV3GUFq
	MFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=fsYwA+EKLJYc+x3o9KfVwg8hU4fs0FcCRxiCbhnWf0Q=;
	b=J4gVikP4HVNGiZsg6uc8qsnGQI5CCOk7B1+X73s1SuvO8jYb/5pKpIpBaxA1OuUx9Z
	dC8hXddzP3mH+ErCdcakMD1GIWyppeWbtFtMBKi2WT1/aEwe8dclK4E2IR+oRWdUVht4
	MI0zdF1ffNxUQxgfftJVjOpDPh8A9S7WBA4HDYhhOqGSM33HIRmuvH0g3jTf3m+wM/gO
	uKuTPd6n+vYn8MArozEpOrGoL1P6tdno0ye3nB15xYT6GPLf+KvMurSUj2362UaoL2a+
	+kOxwoybnOeAhukF1ZCP9uF3604FIOYkCIR1RadVklQ2yLI03h2dwxknQY+dwz/f7e4Z
	ORZA==
X-Gm-Message-State: AMke39kYdLPEaLG5HHxmb+gIBsNNf3dqls4Kh6c5E/pngoXUS1puluQFc0n0VgrnrUOC0w==
X-Received: by 10.36.116.71 with SMTP id o68mr40135itc.60.1488305967137;
	Tue, 28 Feb 2017 10:19:27 -0800 (PST)
Received: from linux-uys3 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o20sm1083519ioo.37.2017.02.28.10.19.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Feb 2017 10:19:26 -0800 (PST)
Date: Tue, 28 Feb 2017 13:19:24 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170228181924.GC16277@linux-uys3>
References: <20170228045004.GA5913@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20170228045004.GA5913@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: npm thoughts
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
X-List-Received-Date: Tue, 28 Feb 2017 18:19:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

In face-to-face conversations there was an expressed opinion that it would be
great if npm had a "--dry-run" -type option to list off the dependencies of a
package.json file.

As it turns out, it does!

	$ npm install --dry-run
	electron-quick-start@1.0.0 /z/npm/source/electron-quick-start.git
	└─┬ electron@1.4.15 
	  ├─┬ electron-download@3.3.0 
	  │ ├─┬ debug@2.6.1 
	  │ │ └── ms@0.7.2 
	  │ ├─┬ fs-extra@0.30.0 
	  │ │ ├── graceful-fs@4.1.11 
	  │ │ ├── jsonfile@2.4.0 
	  │ │ ├── klaw@1.3.1 
	  │ │ ├── path-is-absolute@1.0.1 
	  │ │ └─┬ rimraf@2.6.1 
	  │ │   └─┬ glob@7.1.1 
	  │ │     ├── fs.realpath@1.0.0 
	  │ │     ├─┬ inflight@1.0.6 
	  │ │     │ └── wrappy@1.0.2 
	  │ │     ├─┬ minimatch@3.0.3 
	  │ │     │ └─┬ brace-expansion@1.1.6 
	  │ │     │   ├── balanced-match@0.4.2 
	  │ │     │   └── concat-map@0.0.1 
	  │ │     └── once@1.4.0 
	  │ ├── home-path@1.0.3 
	  │ ├── minimist@1.2.0 
	  │ ├─┬ nugget@2.0.1 
	  │ │ ├─┬ pretty-bytes@1.0.4 
	  │ │ │ ├── get-stdin@4.0.1 
	  │ │ │ └─┬ meow@3.7.0 
	  │ │ │   ├─┬ camelcase-keys@2.1.0 
	  │ │ │   │ └── camelcase@2.1.1 
	  │ │ │   ├── decamelize@1.2.0 
	  │ │ │   ├─┬ loud-rejection@1.6.0 
	  │ │ │   │ ├─┬ currently-unhandled@0.4.1 
	  │ │ │   │ │ └── array-find-index@1.0.2 
	  │ │ │   │ └── signal-exit@3.0.2 
	  │ │ │   ├── map-obj@1.0.1 
	  │ │ │   ├─┬ normalize-package-data@2.3.5 
	  │ │ │   │ ├── hosted-git-info@2.2.0 
	  │ │ │   │ ├─┬ is-builtin-module@1.0.0 
	  │ │ │   │ │ └── builtin-modules@1.1.1 
	  │ │ │   │ └─┬ validate-npm-package-license@3.0.1 
	  │ │ │   │   ├─┬ spdx-correct@1.0.2 
	  │ │ │   │   │ └── spdx-license-ids@1.2.2 
	  │ │ │   │   └── spdx-expression-parse@1.0.4 
	  │ │ │   ├── object-assign@4.1.1 
	  │ │ │   ├─┬ read-pkg-up@1.0.1 
	  │ │ │   │ ├── find-up@1.1.2 
	  │ │ │   │ └─┬ read-pkg@1.1.0 
	  │ │ │   │   ├─┬ load-json-file@1.1.0 
	  │ │ │   │   │ ├─┬ parse-json@2.2.0 
	  │ │ │   │   │ │ └─┬ error-ex@1.3.0 
	  │ │ │   │   │ │   └── is-arrayish@0.2.1 
	  │ │ │   │   │ ├── pify@2.3.0 
	  │ │ │   │   │ └─┬ strip-bom@2.0.0 
	  │ │ │   │   │   └── is-utf8@0.2.1 
	  │ │ │   │   └── path-type@1.1.0 
	  │ │ │   ├─┬ redent@1.0.0 
	  │ │ │   │ ├─┬ indent-string@2.1.0 
	  │ │ │   │ │ └─┬ repeating@2.0.1 
	  │ │ │   │ │   └── is-finite@1.0.2 
	  │ │ │   │ └── strip-indent@1.0.1 
	  │ │ │   └── trim-newlines@1.0.0 
	  │ │ ├─┬ progress-stream@1.2.0 
	  │ │ │ ├── speedometer@0.1.4 
	  │ │ │ └─┬ through2@0.2.3 
	  │ │ │   ├─┬ readable-stream@1.1.14 
	  │ │ │   │ └── isarray@0.0.1 
	  │ │ │   └─┬ xtend@2.1.2 
	  │ │ │     └── object-keys@0.4.0 
	  │ │ ├─┬ request@2.79.0 
	  │ │ │ ├── aws-sign2@0.6.0 
	  │ │ │ ├── aws4@1.6.0 
	  │ │ │ ├── caseless@0.11.0 
	  │ │ │ ├─┬ combined-stream@1.0.5 
	  │ │ │ │ └── delayed-stream@1.0.0 
	  │ │ │ ├── extend@3.0.0 
	  │ │ │ ├── forever-agent@0.6.1 
	  │ │ │ ├─┬ form-data@2.1.2 
	  │ │ │ │ └── asynckit@0.4.0 
	  │ │ │ ├─┬ har-validator@2.0.6 
	  │ │ │ │ ├─┬ chalk@1.1.3 
	  │ │ │ │ │ ├── ansi-styles@2.2.1 
	  │ │ │ │ │ ├── escape-string-regexp@1.0.5 
	  │ │ │ │ │ ├── has-ansi@2.0.0 
	  │ │ │ │ │ └── supports-color@2.0.0 
	  │ │ │ │ ├─┬ commander@2.9.0 
	  │ │ │ │ │ └── graceful-readlink@1.0.1 
	  │ │ │ │ └─┬ is-my-json-valid@2.16.0 
	  │ │ │ │   ├── generate-function@2.0.0 
	  │ │ │ │   ├─┬ generate-object-property@1.2.0 
	  │ │ │ │   │ └── is-property@1.0.2 
	  │ │ │ │   ├── jsonpointer@4.0.1 
	  │ │ │ │   └── xtend@4.0.1 
	  │ │ │ ├─┬ hawk@3.1.3 
	  │ │ │ │ ├── boom@2.10.1 
	  │ │ │ │ ├── cryptiles@2.0.5 
	  │ │ │ │ ├── hoek@2.16.3 
	  │ │ │ │ └── sntp@1.0.9 
	  │ │ │ ├─┬ http-signature@1.1.1 
	  │ │ │ │ ├── assert-plus@0.2.0 
	  │ │ │ │ ├─┬ jsprim@1.3.1 
	  │ │ │ │ │ ├── extsprintf@1.0.2 
	  │ │ │ │ │ ├── json-schema@0.2.3 
	  │ │ │ │ │ └── verror@1.3.6 
	  │ │ │ │ └─┬ sshpk@1.10.2 
	  │ │ │ │   ├── asn1@0.2.3 
	  │ │ │ │   ├── assert-plus@1.0.0 
	  │ │ │ │   ├── bcrypt-pbkdf@1.0.1 
	  │ │ │ │   ├─┬ dashdash@1.14.1 
	  │ │ │ │   │ └── assert-plus@1.0.0 
	  │ │ │ │   ├── ecc-jsbn@0.1.1 
	  │ │ │ │   ├─┬ getpass@0.1.6 
	  │ │ │ │   │ └── assert-plus@1.0.0 
	  │ │ │ │   ├── jodid25519@1.0.2 
	  │ │ │ │   ├── jsbn@0.1.1 
	  │ │ │ │   └── tweetnacl@0.14.5 
	  │ │ │ ├── is-typedarray@1.0.0 
	  │ │ │ ├── isstream@0.1.2 
	  │ │ │ ├── json-stringify-safe@5.0.1 
	  │ │ │ ├─┬ mime-types@2.1.14 
	  │ │ │ │ └── mime-db@1.26.0 
	  │ │ │ ├── oauth-sign@0.8.2 
	  │ │ │ ├── qs@6.3.1 
	  │ │ │ ├── stringstream@0.0.5 
	  │ │ │ ├─┬ tough-cookie@2.3.2 
	  │ │ │ │ └── punycode@1.4.1 
	  │ │ │ ├── tunnel-agent@0.4.3 
	  │ │ │ └── uuid@3.0.1 
	  │ │ ├─┬ single-line-log@1.1.2 
	  │ │ │ └─┬ string-width@1.0.2 
	  │ │ │   ├── code-point-at@1.1.0 
	  │ │ │   ├─┬ is-fullwidth-code-point@1.0.0 
	  │ │ │   │ └── number-is-nan@1.0.1 
	  │ │ │   └─┬ strip-ansi@3.0.1 
	  │ │ │     └── ansi-regex@2.1.1 
	  │ │ └── throttleit@0.0.2 
	  │ ├─┬ path-exists@2.1.0 
	  │ │ └─┬ pinkie-promise@2.0.1 
	  │ │   └── pinkie@2.0.4 
	  │ ├─┬ rc@1.1.7 
	  │ │ ├── deep-extend@0.4.1 
	  │ │ ├── ini@1.3.4 
	  │ │ └── strip-json-comments@2.0.1 
	  │ ├── semver@5.3.0 
	  │ └─┬ sumchecker@1.3.0 
	  │   └── es6-promise@4.0.5 
	  └─┬ extract-zip@1.6.0 
	    ├─┬ concat-stream@1.5.0 
	    │ ├── inherits@2.0.3 
	    │ ├─┬ readable-stream@2.0.6 
	    │ │ ├── core-util-is@1.0.2 
	    │ │ ├── isarray@1.0.0 
	    │ │ ├── process-nextick-args@1.0.7 
	    │ │ ├── string_decoder@0.10.31 
	    │ │ └── util-deprecate@1.0.2 
	    │ └── typedarray@0.0.6 
	    ├── debug@0.7.4 
	    ├─┬ mkdirp@0.5.0 
	    │ └── minimist@0.0.8 
	    └─┬ yauzl@2.4.1 
	      └─┬ fd-slicer@1.0.1 
		└── pend@1.2.0

